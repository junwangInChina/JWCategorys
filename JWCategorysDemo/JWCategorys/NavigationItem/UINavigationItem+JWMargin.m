//
//  UINavigationItem+JWMargin.m
//  JWCategorysDemo
//
//  Created by wangjun on 2018/7/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "UINavigationItem+JWMargin.h"

@implementation UINavigationItem (JWMargin)

- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = -3;
        
        if (leftBarButtonItem)
        {
            [self setLeftBarButtonItems:@[negativeSeperator,leftBarButtonItem]];
        }
        else
        {
            [self setLeftBarButtonItems:@[negativeSeperator]];
        }
    }
    else
    {
        [self setLeftBarButtonItem:leftBarButtonItem animated:NO];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        
        
        // 弹出系统相册时，按钮会偏移
        if (self.title && [self.title isEqualToString:@"Photos"])
        {
            negativeSeperator.width = 0;
        }
        else
        {
            negativeSeperator.width = -3;
        }
        
        if (rightBarButtonItem)
        {
            [self setRightBarButtonItems:@[negativeSeperator,rightBarButtonItem]];
        }
        else
        {
            [self setRightBarButtonItems:@[negativeSeperator]];
        }
    }
    else
    {
        [self setRightBarButtonItem:rightBarButtonItem animated:NO];
    }
}

@end
