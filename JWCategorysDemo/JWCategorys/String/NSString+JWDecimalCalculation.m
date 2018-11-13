//
//  NSString+JWDecimalCalculation.m
//  JWCategorysDemo
//
//  Created by wangjun on 2018/11/13.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "NSString+JWDecimalCalculation.h"

@implementation NSString (JWDecimalCalculation)

- (NSDecimalNumber *)jw_decimalWrapper
{
    return [NSDecimalNumber decimalNumberWithString:self];
}

- (NSDecimal)jw_decimalStruct
{
    return self.jw_decimalWrapper.decimalValue;
}

- (JWCalculation)jw_add
{
    return ^NSString *(NSString *other) {
        NSString *rel = nil;
        @try {
            rel = [self.jw_decimalWrapper decimalNumberByAdding:other.jw_decimalWrapper].stringValue;
            return rel;
        } @catch (NSException *exception) {
            return @"0";
        }
    };
}

- (JWCalculation)jw_sub
{
    return ^NSString *(NSString *other) {
        NSString *rel = nil;
        @try {
            rel = [self.jw_decimalWrapper decimalNumberBySubtracting:other.jw_decimalWrapper].stringValue;
            return rel;
        } @catch (NSException *exception) {
            return @"0";
        }
    };
}

- (JWCalculation)jw_mul
{
    return ^NSString *(NSString *other) {
        NSString *rel = nil;
        @try {
            rel = [self.jw_decimalWrapper decimalNumberByMultiplyingBy:other.jw_decimalWrapper].stringValue;
            return rel;
        } @catch (NSException *exception) {
            return @"0";
        }
    };
}

- (JWCalculation)jw_div
{
    return ^NSString *(NSString *other) {
        NSString *rel = nil;
        @try {
            rel = [self.jw_decimalWrapper decimalNumberByDividingBy:other.jw_decimalWrapper].stringValue;
            return rel;
        } @catch (NSException *exception) {
            return @"0";
        }
    };
}

- (JWDecimal)jw_round_plain
{
    return ^NSString *(NSInteger scale) {
        NSDecimal result;
        NSDecimal origin = self.jw_decimalStruct;
        NSDecimalRound(&result, &origin, scale, NSRoundPlain);
        return [NSDecimalNumber decimalNumberWithDecimal:result].stringValue;
    };
}

- (JWDecimal)jw_round_up
{
    return ^NSString *(NSInteger scale) {
        NSDecimal result;
        NSDecimal origin = self.jw_decimalStruct;
        NSDecimalRound(&result, &origin, scale, NSRoundUp);
        return [NSDecimalNumber decimalNumberWithDecimal:result].stringValue;
    };
}

- (JWDecimal)jw_round_down
{
    return ^NSString *(NSInteger scale) {
        NSDecimal result;
        NSDecimal origin = self.jw_decimalStruct;
        NSDecimalRound(&result, &origin, scale, NSRoundDown);
        return [NSDecimalNumber decimalNumberWithDecimal:result].stringValue;
    };
}

- (JWCompare)jw_g
{
    return ^BOOL (NSString *other) {
        return [self.jw_decimalWrapper compare:other.jw_decimalWrapper] == NSOrderedDescending;
    };
}

- (JWCompare)jw_ge
{
    return ^BOOL (NSString *other) {
        NSComparisonResult rel = [self.jw_decimalWrapper compare:other.jw_decimalWrapper];
        return (rel == NSOrderedDescending || rel == NSOrderedSame);
    };
}

- (JWCompare)jw_l
{
    return ^BOOL (NSString *other) {
        return [self.jw_decimalWrapper compare:other.jw_decimalWrapper] == NSOrderedAscending;
    };
}

- (JWCompare)jw_le
{
    return ^BOOL (NSString *other) {
        NSComparisonResult rel = [self.jw_decimalWrapper compare:other.jw_decimalWrapper];
        return (rel == NSOrderedAscending || rel == NSOrderedSame);
    };
}

- (JWCompare)jw_e
{
    return ^BOOL (NSString *other) {
        return [self.jw_decimalWrapper compare:other.jw_decimalWrapper] == NSOrderedSame;
    };
}

- (JWCompare)jw_ne
{
    return ^BOOL (NSString *other) {
        return [self.jw_decimalWrapper compare:other.jw_decimalWrapper] != NSOrderedSame;
    };
}

@end
