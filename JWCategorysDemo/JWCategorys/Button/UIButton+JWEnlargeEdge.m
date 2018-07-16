//
//  UIButton+JWEnlargeEdge.m
//  JWCategorysDemo
//
//  Created by wangjun on 2018/7/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "UIButton+JWEnlargeEdge.h"

#import <objc/runtime.h>

static char topMarginKey;
static char bottomMarginKey;
static char leftMarginKey;
static char rightMarginKey;

@implementation UIButton (JWEnlargeEdge)

- (void)setEnlargeMargin:(CGFloat)margin
{
    objc_setAssociatedObject(self, &topMarginKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomMarginKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftMarginKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightMarginKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdge:(UIEdgeInsets)edge
{
    objc_setAssociatedObject(self, &topMarginKey, [NSNumber numberWithFloat:edge.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomMarginKey, [NSNumber numberWithFloat:edge.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftMarginKey, [NSNumber numberWithFloat:edge.left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightMarginKey, [NSNumber numberWithFloat:edge.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect tempEnlargeReact = [self enlargeReact];
    if (CGRectEqualToRect(tempEnlargeReact, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(tempEnlargeReact, point);
}

- (CGRect)enlargeReact
{
    NSNumber *tempTopMargin = objc_getAssociatedObject(self, &topMarginKey);
    NSNumber *tempBottomMargin = objc_getAssociatedObject(self, &bottomMarginKey);
    NSNumber *tempLeftMargin = objc_getAssociatedObject(self, &leftMarginKey);
    NSNumber *tempRightMargin = objc_getAssociatedObject(self, &rightMarginKey);
    if (tempTopMargin && tempLeftMargin && tempBottomMargin && tempRightMargin)
    {
        return CGRectMake(self.bounds.origin.x - tempLeftMargin.floatValue,
                          self.bounds.origin.y - tempTopMargin.floatValue,
                          self.bounds.size.width + tempLeftMargin.floatValue + tempRightMargin.floatValue,
                          self.bounds.size.height + tempTopMargin.floatValue + tempBottomMargin.floatValue);
    }
    return self.bounds;
}

@end
