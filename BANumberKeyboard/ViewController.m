//
//  ViewController.m
//  BANumberKeyboard
//
//  Created by abel on 15/4/24.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "ViewController.h"
#import "BATextField.h"

@interface ViewController () {
    BATextField *numberTextField;
    BATextField *moneyTextField;
    BATextField *idTextField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    numberTextField = [[BATextField alloc] initWithFrame:(CGRect){15,30,290,40}];
    numberTextField.placeholder = @"纯数字键盘";
    [numberTextField setKeyboardType:BAKeyboardTypeNumber];
    [self.view addSubview:numberTextField];
    
    moneyTextField = [[BATextField alloc] initWithFrame:(CGRect){15,80,290,40}];
    moneyTextField.placeholder = @"金额数字键盘";
    moneyTextField.numberKeyboardType = BANumberKeyboardTypeDouble;
    [self.view addSubview:moneyTextField];
    
    
    idTextField = [[BATextField alloc] initWithFrame:(CGRect){15,130,290,40}];
    idTextField.placeholder = @"身份证键盘";
    idTextField.numberKeyboardType = BANumberKeyboardTypeIDCard;
    [self.view addSubview:idTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
