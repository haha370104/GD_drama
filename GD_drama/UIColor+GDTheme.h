//
//  UIColor+GDTheme.h
//  Baixing
//
//  Created by hyice on 15/8/18.
//  Copyright (c) 2015年 Baixing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GDConverter)

+ (UIColor *)gd_colorFromHexRGB:(NSInteger)rgbValue;

+ (UIColor *)gd_colorFromHexRGB:(NSInteger)rgbValue alpha:(CGFloat)alpha;

+ (UIColor *)gd_colorFromRGBColor:(UIColor *)color alpha:(CGFloat)alpha;

+ (UIColor *)gd_colorFromHexString:(NSString *)hexString;

@end




@interface UIColor (GDQuickUsage)

+ (UIColor *)gd_themeColor;

+ (UIColor *)gd_separatorGray;
+ (UIColor *)gd_darkSeparatorGray;

+ (UIColor *)gd_backgroundGray;

+ (UIColor *)gd_separatorColor __attribute__((deprecated));


@end


@interface UIColor (GDTheme)

#pragma mark - black or white

+ (UIColor *)gd_blackColor;
+ (UIColor *)gd_darkGrayColor;
+ (UIColor *)gd_grayColor;
+ (UIColor *)gd_lightGrayColor;
+ (UIColor *)gd_aLittleGrayColor;
/*
 * Deprecated. Use gd_almostWhiteColor instead.
 */
+ (UIColor *)gd_lightLightGrayColor __attribute__((deprecated));
+ (UIColor *)gd_almostWhiteColor;
+ (UIColor *)gd_whiteColor;


#pragma mark - colorful world
+ (UIColor *)gd_radicalRedColor;
+ (UIColor *)gd_yellowColor;
+ (UIColor *)gd_greenColor;
+ (UIColor *)gd_blueColor;
+ (UIColor *)gd_orangeColor;


@end
