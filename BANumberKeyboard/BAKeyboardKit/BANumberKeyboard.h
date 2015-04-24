//
//  PTPNumberKeyboard.h
//  PersonToPerson
//
//  Created by abel on 14/12/19.
//  Copyright (c) 2014年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BANumberKeyboardDelegate;

@interface BANumberKeyboard : UIView

@property (nonatomic, weak) id<BANumberKeyboardDelegate> delegate;

@end

@protocol BANumberKeyboardDelegate <NSObject>

-(BOOL)textFieldShouldReturn:(BANumberKeyboard *)numberKeyboard;
-(BOOL)textFieldShouldDelete:(BANumberKeyboard *)numberKeyboard;
-(void)numberKeyboard:(BANumberKeyboard *)numberKeyboard replacementString:(NSString *)string;
-(void)keyboardButtonOnclick;

@end