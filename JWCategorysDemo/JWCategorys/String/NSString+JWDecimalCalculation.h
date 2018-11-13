//
//  NSString+JWDecimalCalculation.h
//  JWCategorysDemo
//
//  Created by wangjun on 2018/11/13.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^JWCalculation)(NSString *param);
typedef NSString *(^JWDecimal)(NSInteger scale);
typedef BOOL (^JWCompare)(NSString *param);

@interface NSString (JWDecimalCalculation)

- (NSDecimalNumber *)jw_decimalWrapper;
- (NSDecimal)jw_decimalStruct;

// 计算
- (JWCalculation)jw_add;   // +
- (JWCalculation)jw_sub;   // -
- (JWCalculation)jw_mul;   // *
- (JWCalculation)jw_div;   // %

// 小数位
- (JWDecimal)jw_round_plain;    // 四舍五入      5.6781 --> @"5.6781".jw_rounding(2) = 5.68
- (JWDecimal)jw_round_up;       // 向上取整      5.6711 --> @"5.6711".jw_ceil(2) = 5.68
- (JWDecimal)jw_round_down;     // 向下取整      5.6781 --> @"5.6781".jw_floor(2) = 5.67

// 比较
- (JWCompare)jw_g;              // greater then >
- (JWCompare)jw_ge;             // greater then or equal to >=
- (JWCompare)jw_l;              // less then <
- (JWCompare)jw_le;             // less then or equal to <=
- (JWCompare)jw_e;              // equal =
- (JWCompare)jw_ne;             // not equal !=

@end
