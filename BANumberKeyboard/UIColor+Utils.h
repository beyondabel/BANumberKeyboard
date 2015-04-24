//
//  UIColor+Utils.h
//  PersonToPerson
//
//  Created by abel on 14/12/11.
//  Copyright (c) 2014年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIImage *)imageColor:(UIColor *)color;

@end
