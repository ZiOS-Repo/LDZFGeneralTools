//
//  IUNumberFormatter.h
//  CRJGeneralTools_Example
//
//  Created by zhuyuhui on 2020/9/12.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface IUNumberFormatter : NSObject

/**
 *  Get percent style value string(eg: 0.12 -> 12%).
 *
 *  @param value                 Input value.
 *  @param maximumFractionDigits Maximum fraction digits.
 *  @param minimumFractionDigits Minimum fraction digits.
 *  @param roundingMode          NSNumberFormatterRoundingMode.
 *
 *  @return Percent style value string.
 */
+ (NSString *)PercentStyleWithValue:(CGFloat)value
              maximumFractionDigits:(NSUInteger)maximumFractionDigits
              minimumFractionDigits:(NSUInteger)minimumFractionDigits
                       roundingMode:(NSNumberFormatterRoundingMode)roundingMode;

/**
 *  Get percent style value string(eg: 0.12 -> 12%).
 *
 *  @param value                 Input Number value.
 *  @param maximumFractionDigits Maximum fraction digits.
 *  @param minimumFractionDigits Minimum fraction digits.
 *  @param roundingMode          NSNumberFormatterRoundingMode.
 *
 *  @return Percent style value string.
 */
+ (NSString *)PercentStyleWithNumberValue:(NSNumber *)value
                    maximumFractionDigits:(NSUInteger)maximumFractionDigits
                    minimumFractionDigits:(NSUInteger)minimumFractionDigits
                             roundingMode:(NSNumberFormatterRoundingMode)roundingMode;

/**
 *  Get decimal style value string.(eg: 23 -> 23.00)
 *
 *  @param value                 Input value.
 *  @param maximumFractionDigits Maximum fraction digits.
 *  @param minimumFractionDigits Minimum fraction digits.
 *  @param roundingMode          NSNumberFormatterRoundingMode.
 *
 *  @return Decimal style value string.
 */
+ (NSString *)decimalStyleWithValue:(CGFloat)value
              maximumFractionDigits:(NSUInteger)maximumFractionDigits
              minimumFractionDigits:(NSUInteger)minimumFractionDigits
                       roundingMode:(NSNumberFormatterRoundingMode)roundingMode;

/**
 *  Get decimal style value string.(eg: 23 -> 23.00)
 *
 *  @param value                 Input NSNumber value.
 *  @param maximumFractionDigits Maximum fraction digits.
 *  @param minimumFractionDigits Minimum fraction digits.
 *  @param roundingMode          NSNumberFormatterRoundingMode.
 *
 *  @return Decimal style value string.
 */
+ (NSString *)decimalStyleWithNumberValue:(NSNumber *)value
                    maximumFractionDigits:(NSUInteger)maximumFractionDigits
                    minimumFractionDigits:(NSUInteger)minimumFractionDigits
                             roundingMode:(NSNumberFormatterRoundingMode)roundingMode;
@end
