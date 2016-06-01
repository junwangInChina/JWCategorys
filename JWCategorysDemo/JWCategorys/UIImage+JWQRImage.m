//
//  UIImage+JWQRImage.m
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "UIImage+JWQRImage.h"

@implementation UIImage (JWQRImage)

+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string
{
    return [self JW_QRCodeImageWithString:string width:0];
}

+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string width:(CGFloat)width
{
    return [self JW_QRCodeImageWithString:string width:width color:nil];
}

+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string width:(CGFloat)width color:(UIColor *)color
{
    return [self JW_QRCodeImageWithString:string width:width color:color waterImage:nil];
}

+ (UIImage *)JW_QRCodeImageWithString:(NSString *)string width:(CGFloat)width color:(UIColor *)color waterImage:(UIImage *)waterImage
{
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    /**
     *  设置纠错级别
     *  Level L – up to 7% damage
     *  Level M – up to 15% damage
     *  Level Q – up to 25% damage
     *  Level H – up to 30% damage
     */
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // 生成CIImage
    CIImage *qrCIImage = qrFilter.outputImage;
    
    // 二维码图片默认宽度300px
    if (width == 0)
    {
        width = 300;
    }
    CGRect extent = CGRectIntegral(qrCIImage.extent);
    CGFloat scale = MIN(width/CGRectGetWidth(extent), width/CGRectGetHeight(extent));
    
    // 创建bitmap
    size_t bitmapWidth = CGRectGetWidth(extent) * scale;
    size_t bitmapHeight = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil,
                                                   bitmapWidth,
                                                   bitmapHeight,
                                                   8,
                                                   0,
                                                   cs,
                                                   (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:qrCIImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // 清除内存
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    // 原图
    UIImage *outputImage;
    if (!color)
    {
        // 不需要自定义颜色
        outputImage = [UIImage imageWithCGImage:scaledImage];
    }
    else
    {
        // 需要自定义颜色
        outputImage = [self updateImageColor:[UIImage imageWithCGImage:scaledImage]
                                       color:color];
    }
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0, 0, width, width)];
    
    // 水印
    if (waterImage)
    {
        [waterImage drawInRect:CGRectMake((width-75)/2.0, (width-75)/2.0, 75, 75)];
        UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newPic;
    }
    else
    {
        return outputImage;
    }
}

+ (UIImage *)updateImageColor:(UIImage *)image color:(UIColor *)color
{
    CGFloat color_red = 0;
    CGFloat color_green = 0;
    CGFloat color_blue = 0;
    CGFloat color_alpha = 0;
    
    [color getRed:&color_red green:&color_green blue:&color_blue alpha:&color_alpha];
    
    color_red *= 255;
    color_green *= 255;
    color_blue *= 255;
    
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t bytesPreRow = imageWidth * 4;
    uint32_t *rgbImageBuf = (uint32_t *)malloc(bytesPreRow * imageHeight);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef contextRef = CGBitmapContextCreate(rgbImageBuf,
                                                    imageWidth,
                                                    imageHeight,
                                                    8,
                                                    bytesPreRow,
                                                    colorSpace,
                                                    kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(contextRef, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    int pixeNum = imageWidth * imageHeight;
    uint32_t *pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixeNum; i++, pCurPtr++)
    {
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900)
        {
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[3] = color_red;
            ptr[2] = color_green;
            ptr[1] = color_blue;
        }
        else
        {
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[0] = 0;
        }
    }
    
    CGDataProviderRef dataProviderRef = CGDataProviderCreateWithData(NULL,
                                                                     rgbImageBuf,
                                                                     bytesPreRow * imageHeight,
                                                                     ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth,
                                        imageHeight,
                                        8,
                                        32,
                                        bytesPreRow,
                                        colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little,
                                        dataProviderRef,
                                        NULL,
                                        true,
                                        kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProviderRef);
    
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);
    
    return resultImage;
}

void ProviderReleaseData (void *info, const void *data, size_t size)
{
    free((void *)data);
}

@end
