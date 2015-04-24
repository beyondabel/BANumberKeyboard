//
//  BATextField.m
//  BANumberKeyboard
//
//  Created by abel on 15/4/24.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "BATextField.h"
#import "BANumberKeyboard.h"

@interface BATextField () <BANumberKeyboardDelegate>

@end

@implementation BATextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        BANumberKeyboard * numberKeyboard = [[BANumberKeyboard alloc] init];
        self.inputView = numberKeyboard;
        numberKeyboard.delegate = self;
    }
    return self;
}

#pragma mark - BANumberKeyboardDelegate
-(BOOL)textFieldShouldReturn:(BANumberKeyboard *)numberKeyboard {
    [self.delegate textFieldShouldReturn:self];
    return YES;
}

-(BOOL)textFieldShouldDelete:(BANumberKeyboard *)numberKeyboard {
    [self deleteBackward];
    return YES;
}

-(void)numberKeyboard:(BANumberKeyboard *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:(NSRange){0,0} replacementString:string];
    }
    if (canEditor) {
        self.text = [NSString stringWithFormat:@"%@%@",self.text,string];
    }
}

-(void)keyboardButtonOnclick {
    [self resignFirstResponder];
}

@end
