//
//  UIImage+JWColor.m
//  JWCategorysDemo
//
//  Created by wangjun on 2018/7/17.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "UIImage+JWColor.h"

@implementation UIImage (JWColor)

+ (UIImage *)jw_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
