//
//  UIImage+JWQRImage.h
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  图片类别，方便生成二维码
 */

@interface UIImage (JWQRImage)

/**
 *  生成一个二维码
 *
 *  @param string 二维码内容
 *
 *  @return 返回生成的二维码图片
 */
+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string;

/**
 *  生成一个二维码
 *
 *  @param string 二维码内容
 *  @param width  图片宽度
 *
 *  @return 返回生成的二维码图片
 */
+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string
                                width:(CGFloat)width;

/**
 *  生成一个二维码
 *
 *  @param string 二维码内容
 *  @param width  图片宽度
 *  @param color  二维码颜色
 *
 *  @return 返回生成的二维码图片
 */
+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string
                                width:(CGFloat)width
                                color:(UIColor *)color;

/**
 *  生成一个二维码
 *
 *  @param string     二维码内容
 *  @param width      图片宽度
 *  @param color      二维码颜色
 *  @param waterImage 水印(一般为二维码中间的icon)
 *
 *  @return 返回生成的二维码图片
 */
+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string
                                width:(CGFloat)width
                                color:(UIColor *)color
                           waterImage:(UIImage *)waterImage;

@end
