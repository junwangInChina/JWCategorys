//
//  UIImage+JWHexColor.m
//  JWCategorysDemo
//
//  Created by wangjun on 16/6/1.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "UIImage+JWHexColor.h"

@implementation UIImage (JWHexColor)

+ (UIColor *)JW_ColorWithHexString:(NSString *)hexString
{
    return [self JW_ColorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)JW_ColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    // 过滤掉传入的颜色字符串不是6位的情况
    if ([hexString length] != 6)
    {
        return nil;
    }
    // 再过滤掉故意传的假的颜色值*&^%$@之类的
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-fA-F|0-9]" options:0 error:NULL];
    NSUInteger match = [regex numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, [hexString length])];
    if (match != 0)
    {
        return nil;
    }
    
    NSRange rRange = NSMakeRange(0, 2);
    NSString *rComponent = [hexString substringWithRange:rRange];
    NSUInteger rVal = 0;
    NSScanner *rScanner = [NSScanner scannerWithString:rComponent];
    [rScanner scanHexInt:&rVal];
    float rRetVal = (float)rVal / 254;
    
    NSRange gRange = NSMakeRange(2, 2);
    NSString *gComponent = [hexString substringWithRange:gRange];
    NSUInteger gVal = 0;
    NSScanner *gScanner = [NSScanner scannerWithString:gComponent];
    [gScanner scanHexInt:&gVal];
    float gRetVal = (float)gVal / 254;
    
    NSRange bRange = NSMakeRange(4, 2);
    NSString *bComponent = [hexString substringWithRange:bRange];
    NSUInteger bVal = 0;
    NSScanner *bScanner = [NSScanner scannerWithString:bComponent];
    [bScanner scanHexInt:&bVal];
    float bRetVal = (float)bVal / 254;
    
    return [UIColor colorWithRed:rRetVal green:gRetVal blue:bRetVal alpha:1.0f];
}

- (UIColor *)JW_ColorWithComplementary
{
    UIColor *selfColor = self;
    if ([selfColor isEqual:[UIColor blackColor]])
    {
        selfColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    else if ([selfColor isEqual:[UIColor darkGrayColor]])
    {
        selfColor = [UIColor colorWithRed:84.915/255.f green:84.915/255.f blue:84.915/255.f alpha:1];
    }
    else if ([selfColor isEqual:[UIColor lightGrayColor]])
    {
        selfColor = [UIColor colorWithRed:170.085/255.f green:170.085/255.f blue:170.085/255.f alpha:1];
    }
    else if ([selfColor isEqual:[UIColor whiteColor]])
    {
        selfColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    }
    else if ([selfColor isEqual:[UIColor grayColor]])
    {
        selfColor = [UIColor colorWithRed:127.5/255.f green:127.5/255.f blue:127.5/255.f alpha:1];
    }
    
    const CGFloat *componentColors = CGColorGetComponents(selfColor.CGColor);
    
    UIColor *convertedColor = [[UIColor alloc] initWithRed:(1.0 - componentColors[0])
                                                     green:(1.0 - componentColors[1])
                                                      blue:(1.0 - componentColors[2])
                                                     alpha:componentColors[3]];
    return convertedColor;
}

- (NSString *)JW_HexValues
{
    UIColor *selfColor = self;
    if (!selfColor)
    {
        return nil;
    }
    
    if (selfColor == [UIColor whiteColor])
    {
        // Special case, as white doesn't fall into the RGB color space
        return @"ffffff";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [selfColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255);
    int greenDec = (int)(green * 255);
    int blueDec = (int)(blue * 255);
    
    NSString *hexString = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return hexString;
}

@end
