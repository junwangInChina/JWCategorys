//
//  UIColor+JWHexColor.h
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  整合网上的颜色扩展
 *  支持通过十进制颜色字符串获取颜色
 *  支持通过颜色获取其互补色
 *  支持通过颜色获取其对应的十进制字符串
 */

@interface UIColor (JWHexColor)

/**
 *  通过一个十进制字符串，获取对应的颜色，透明度默认1
 *
 *  @param hexString 十进制字符串
 *
 *  @return 颜色
 */
+ (UIColor *)JW_ColorWithHexString:(NSString *)hexString;

/**
 *  通过一个十进制字符串，获取对应的颜色，透明度可设定
 *
 *  @param hexString 十进制字符串
 *  @param alpha     透明度
 *
 *  @return 颜色
 */
+ (UIColor *)JW_ColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 *  通过当前颜色，获取它的互补色
 *
 *  @return 互补色
 */
- (UIColor *)JW_ColorWithComplementary;

/**
 *  获取当前颜色的Hex值
 *
 *  @return 返回当前颜色的Hex值
 */
- (NSString *)JW_HexValues;

@end
