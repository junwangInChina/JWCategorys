//
//  ViewController.m
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "ViewController.h"

#import "UIColor+HexColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *tempColor = [UIColor JW_ColorWithHexString:@"f90876"];
    NSLog(@"tempColor的hexValues %@",[tempColor JW_HexValues]);
    NSLog(@"tempColor的Complementary %@",[tempColor JW_ColorWithComplementary]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
