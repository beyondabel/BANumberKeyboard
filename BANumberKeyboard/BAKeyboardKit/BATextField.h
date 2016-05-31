//
//  BATextField.h
//  BANumberKeyboard
//
//  Created by abel on 15/4/24.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BANumberKeyboard.h"

typedef enum {
    BAKeyboardTypeDefault,  // 系统默认键盘
    BAKeyboardTypeNumber,   // 数字键盘
} BAKeyboardType;

@interface BATextField : UITextField

@property (nonatomic, assign) BANumberKeyboardType numberKeyboardType;

- (void)setKeyboardType:(BAKeyboardType)keyboardType;

@end


@interface UITextField (ExtentRange)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

@end