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
    BATextField * textField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    textField = [[BATextField alloc] initWithFrame:(CGRect){15,30,290,40}];
    [self.view addSubview:textField];
    
    textField.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
