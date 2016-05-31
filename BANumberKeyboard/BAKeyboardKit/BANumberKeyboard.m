//
//  BANumberKeyboard.m
//  PersonToPerson
//
//  Created by abel on 14/12/19.
//  Copyright (c) 2014年 abel. All rights reserved.
//

#import "BANumberKeyboard.h"
#import "BAButton.h"
#import "UIColor+Utils.h"

#define BAScreen_Size [UIScreen mainScreen].bounds.size

@interface BANumberKeyboard ()
{
    NSArray * keyboardTitle;
}
@end

@implementation BANumberKeyboard

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, BAScreen_Size.height - 216, BAScreen_Size.width, 216)]) {
        self.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:222/255.0 alpha:1];         // dbdbde
        
        self.frame = CGRectMake(0, BAScreen_Size.height - 216, BAScreen_Size.width, 216);
    }
    return self;
}

- (void)createdKeyboard {
    if ([self.delegate numberKeyboardType:self] == BANumberKeyboardTypeIDCard) {
        keyboardTitle = [self keyboardTypeIDCardButtonTitle];
    } else {
        keyboardTitle = [self keyboardTypeNumberButtonTitle];
    }
    
    CGFloat buttonWidth = (BAScreen_Size.width - 42) / 4;
    CGFloat top = 9;
    CGFloat left = 7;
    
    for (NSInteger index = 0; index < 11; index ++) {
        BAButton * button = [[BAButton alloc] initWithFrame:(CGRect){left + (index % 3) * (buttonWidth + 8),top + (index / 3) * 51.5,buttonWidth,47}];
        button.tag = 1000 + index;
        NSString * title = keyboardTitle[index];
        if ([title isEqualToString:@"."] && [self.delegate numberKeyboardType:self] == BANumberKeyboardTypeNumber) {
            button.button.enabled = NO;
            [button.button setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1] forState:UIControlStateNormal];
            [button.button setBackgroundImage:[BAButton imageColor:[UIColor colorFromHexString:@"#c9cbd0"]] forState:UIControlStateNormal];
        }
        
        [button setButtonTitle:keyboardTitle[index]];
        [button.button addTarget:self action:@selector(keyButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    BAButton * button = [[BAButton alloc] initWithFrame:(CGRect){left + (11 % 3) * (buttonWidth + 8),top + (11 / 3) * 51.5,buttonWidth,47}];
    [button setButtonTitle:@"\ue602"];
    button.button.titleLabel.font = [UIFont fontWithName:@"iconfont" size:30];
    [button.button addTarget:self action:@selector(keyboardButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    BAButton * deleteButton = [[BAButton alloc] initWithFrame:(CGRect){BAScreen_Size.width - 7 - buttonWidth,9,buttonWidth,97}];
    [deleteButton setButtonTitle:@"\ue601"];
    deleteButton.button.titleLabel.font = [UIFont fontWithName:@"iconfont" size:30];
    deleteButton.lineView.layer.cornerRadius = 4;
    deleteButton.button.layer.cornerRadius = 4;
    [deleteButton.button setBackgroundImage:[BAButton imageColor:[UIColor colorFromHexString:@"#f7f7f7"]] forState:UIControlStateNormal];
    [deleteButton.button setBackgroundImage:[BAButton imageColor:[UIColor colorFromHexString:@"#c9cbd0"]] forState:UIControlStateHighlighted];
    [deleteButton.button addTarget:self action:@selector(deleteButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteButton];
    
    BAButton * ackbutton = [[BAButton alloc] initWithFrame:(CGRect){BAScreen_Size.width - 7 - buttonWidth,deleteButton.frame.size.height + deleteButton.frame.origin.y + 7,buttonWidth,97}];
    [ackbutton.button setBackgroundImage:[BAButton imageColor:[UIColor colorFromHexString:@"#007aff"]] forState:UIControlStateNormal];
    [ackbutton.button setBackgroundImage:[BAButton imageColor:[UIColor colorFromHexString:@"#1361b8"]] forState:UIControlStateHighlighted];
    [ackbutton.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ackbutton.button addTarget:self action:@selector(ackbuttonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    ackbutton.lineView.layer.cornerRadius = 4;
    ackbutton.button.layer.cornerRadius = 4;
    ackbutton.button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [ackbutton setButtonTitle:@"确认"];
    [self addSubview:ackbutton];
}

- (NSArray *)keyboardTypeIDCardButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"X",@"0",@"\ue607"];
}

- (NSArray *)keyboardTypeNumberButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"\ue607"];
}

- (void)keyButtonOnclick:(UIButton *) button {
    if([self.delegate respondsToSelector:@selector(numberKeyboard:replacementString:)]) {
        NSInteger index = [button.superview tag] - 1000;
        if (keyboardTitle.count > index) {
            [self.delegate numberKeyboard:self replacementString:keyboardTitle[index]];
        }
    }
}

- (void)deleteButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldDelete:self];
}

- (void)ackbuttonOnclick:(UIButton *) button {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        [self.delegate textFieldShouldReturn:self];
    }
}

- (void)keyboardButtonOnclick:(UIButton *)button {
    [self.delegate keyboardButtonOnclick];
}

@end
