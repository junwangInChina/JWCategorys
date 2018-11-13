//
//  ViewController.m
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "ViewController.h"

#import "JWCategorys/JWCategorys.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *tempColor = [UIColor JW_ColorWithHexString:@"f90876"];
    NSLog(@"tempColor的hexValues %@",[tempColor JW_HexValues]);
    NSLog(@"tempColor的Complementary %@",[tempColor JW_ColorWithComplementary]);
    
    NSString *tempS = [NSDecimalNumber decimalNumberWithString:@"0.12ewqeqe3131313adadadad"].stringValue;
    NSLog(@"%@",tempS);
    NSString *tempA = @"0.11111111111111";
    NSString *tempB = @"0.22222222222222";
    NSLog(@"原始加减:%@ + %@ = %f",tempA,tempB,[tempA floatValue] + [tempB floatValue]);
    NSLog(@"高精度加减:%@ + %@ = %@",tempA,tempB,tempA.jw_add(tempB));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
