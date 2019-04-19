//
//  UIButton+JWImagePosition.m
//  JWCategorysDemo
//
//  Created by wangjun on 2019/4/19.
//  Copyright © 2019 wangjun. All rights reserved.
//

#import "UIButton+JWImagePosition.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define JW_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define JW_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

@implementation UIButton (JWImagePosition)

- (void)setImagePositionWithType:(JWImagePositionType)type spacing:(CGFloat)spacing
{
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    CGSize titleSize = JW_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    
    switch (type)
    {
        case JWImagePositionTypeLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        }
            break;
        case JWImagePositionTypeRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0, imageSize.width + spacing);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + spacing, 0, - titleSize.width);
        }
            break;
        case JWImagePositionTypeTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (imageSize.height + spacing), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0, 0, - titleSize.width);
        }
            break;
        case JWImagePositionTypeBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(- (imageSize.height + spacing), - imageSize.width, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, - (titleSize.height + spacing), - titleSize.width);
        }
            break;
    }
}

@end
