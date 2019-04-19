//
//  UIButton+JWImagePosition.h
//  JWCategorysDemo
//
//  Created by wangjun on 2019/4/19.
//  Copyright © 2019 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JWImagePositionType) {
    JWImagePositionTypeLeft,   //图片在左，标题在右，默认风格
    JWImagePositionTypeRight,  //图片在右，标题在左
    JWImagePositionTypeTop,    //图片在上，标题在下
    JWImagePositionTypeBottom  //图片在下，标题在上
};

@interface UIButton (JWImagePosition)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现图片和标题的自由排布
 *  注意：1.该方法需在设置图片和标题之后才调用;
         2.图片和标题改变后需再次调用以重新计算titleEdgeInsets和imageEdgeInsets
 *
 *  @param type    图片位置类型
 *  @param spacing 图片和标题之间的间隙
 */
- (void)setImagePositionWithType:(JWImagePositionType)type spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
