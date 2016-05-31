//
//  BANumberKeyboard.h
//  PersonToPerson
//
//  Created by abel on 14/12/19.
//  Copyright (c) 2014年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BANumberKeyboardTypeNumber,     // 纯数字键盘
    BANumberKeyboardTypeDouble,     // 带小数键盘
    BANumberKeyboardTypeIDCard,     // 身份证键盘
} BANumberKeyboardType;

@protocol BANumberKeyboardDelegate;

@interface BANumberKeyboard : UIView

@property (nonatomic, weak) id<BANumberKeyboardDelegate> delegate;

- (void)createdKeyboard;

@end

@protocol BANumberKeyboardDelegate <NSObject>

- (BOOL)textFieldShouldReturn:(BANumberKeyboard *)numberKeyboard;
- (BOOL)textFieldShouldDelete:(BANumberKeyboard *)numberKeyboard;
- (void)numberKeyboard:(BANumberKeyboard *)numberKeyboard replacementString:(NSString *)string;
- (void)keyboardButtonOnclick;
- (BANumberKeyboardType)numberKeyboardType:(BANumberKeyboard *)numberKeyboard;

@end