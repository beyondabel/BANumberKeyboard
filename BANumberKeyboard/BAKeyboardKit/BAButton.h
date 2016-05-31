//
//  BAButton.h
//  BAActionSheet
//
//  Created by abel on 15/1/23.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAButton : UIView

@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIView * lineView;

+ (UIImage *)imageColor:(UIColor *)color;

- (void)setButtonTitle:(NSString *)title;


@end
