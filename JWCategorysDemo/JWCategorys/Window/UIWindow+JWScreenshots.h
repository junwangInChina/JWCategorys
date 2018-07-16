//
//  UIWindow+JWScreenshots.h
//  JWCategorysDemo
//
//  Created by wangjun on 2018/7/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (JWScreenshots)

- (UIImage *)screenshot;

- (UIImage *)screenshotWithRect:(CGRect)rect;

@end
