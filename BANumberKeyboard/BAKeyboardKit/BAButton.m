//
//  BAButton.m
//  BAActionSheet
//
//  Created by abel on 15/1/23.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "BAButton.h"
#import "UIColor+Utils.h"

@interface BAButton ()

@end

@implementation BAButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.lineView = [[UIView alloc] initWithFrame:(CGRect){0, 0, frame.size.width, frame.size.height}];
        self.lineView.layer.masksToBounds = YES;
        self.lineView.layer.borderColor = [UIColor colorWithRed:134/255.0 green:134/255.0 blue:135/255.0 alpha:1].CGColor;
        self.lineView.layer.borderWidth = 1;
        self.lineView.layer.cornerRadius = 2;
        [self addSubview:self.lineView];
        
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        self.button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height -1);
        self.button.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
        [self.button setBackgroundImage:[UIColor imageColor:[UIColor colorFromHexString:@"#f7f7f7"]] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[UIColor imageColor:[UIColor colorFromHexString:@"#c9cbd0"]] forState:UIControlStateHighlighted];
        self.button.layer.masksToBounds = YES;
        self.button.layer.cornerRadius = 2;
        [self addSubview:self.button];
    }
    return self;
}

- (void)setButtonTitle:(NSString *)title {
    [self.button setTitle:title forState:UIControlStateNormal];
}

@end
