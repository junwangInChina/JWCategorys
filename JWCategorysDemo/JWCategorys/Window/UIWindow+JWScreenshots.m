//
//  UIWindow+JWScreenshots.m
//  JWCategorysDemo
//
//  Created by wangjun on 2018/7/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "UIWindow+JWScreenshots.h"

@implementation UIWindow (JWScreenshots)

- (UIImage *)screenshot
{
    return [self screenshotWithRect:self.bounds];
}

- (UIImage *)screenshotWithRect:(CGRect)rect
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGSize imageSize = CGSizeZero;
    CGFloat width = rect.size.width, height = rect.size.height;
    CGFloat x = rect.origin.x, y = rect.origin.y;
    
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
        imageSize = CGSizeMake(width, height);
        x = rect.origin.x;
        y = rect.origin.y;
    }
    else
    {
        imageSize = CGSizeMake(height, width);
        x = rect.origin.y;
        y = rect.origin.x;
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.center.x, self.center.y);
    CGContextConcatCTM(context, self.transform);
    CGContextTranslateCTM(context, -self.bounds.size.width * self.layer.anchorPoint.x, -self.bounds.size.height * self.layer.anchorPoint.y);
    
    if(orientation == UIInterfaceOrientationLandscapeLeft)
    {
        CGContextRotateCTM(context, (CGFloat)M_PI_2);
        CGContextTranslateCTM(context, 0, -self.bounds.size.height);
        CGContextTranslateCTM(context, -x, y);
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        CGContextRotateCTM(context, (CGFloat)-M_PI_2);
        CGContextTranslateCTM(context, -self.bounds.size.width, 0);
        CGContextTranslateCTM(context, x, -y);
    }
    else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        CGContextRotateCTM(context, (CGFloat)M_PI);
        CGContextTranslateCTM(context, -self.bounds.size.height, -self.bounds.size.width);
        CGContextTranslateCTM(context, x, y);
    }
    else
    {
        CGContextTranslateCTM(context, -x, -y);
    }
    
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    else
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    CGContextRestoreGState(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
