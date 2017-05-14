//
//  UIColor+GDTheme.m
//  Baixing
//
//  Created by hyice on 15/8/18.
//  Copyright (c) 2015年 Baixing. All rights reserved.
//

#import "UIColor+GDTheme.h"

@implementation UIColor (GDConverter)

+ (UIColor *)gd_colorFromHexRGB:(NSInteger)rgbValue
{
    return [self gd_colorFromHexRGB:rgbValue alpha:1.0];
}

+ (UIColor *)gd_colorFromHexRGB:(NSInteger)rgbValue alpha:(CGFloat)alpha
{
    NSInteger mask = 0x000000FF;
    CGFloat red = ((rgbValue >> 16) & mask) / 255.0;
    CGFloat green = ((rgbValue >> 8) & mask) / 255.0;
    CGFloat blue = (rgbValue & mask) / 255.0;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)gd_colorFromRGBColor:(UIColor *)color alpha:(CGFloat)alpha
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    if (CGColorGetNumberOfComponents(color.CGColor) == 2) {
        return [UIColor colorWithRed:components[0] green:components[0] blue:components[0] alpha:alpha];
    } else {
        return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:alpha];
    }
}

+ (UIColor *)gd_colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if ([hexString hasPrefix:@"#"]) {
        [scanner setScanLocation:1];
    } else if ([hexString hasPrefix:@"0x"]) {
        [scanner setScanLocation:2];
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0 green:((rgbValue & 0xFF00) >> 8) / 255.0 blue:(rgbValue & 0xFF) / 255.0 alpha:1.0];
}

@end




@implementation UIColor (GDQuickUsage)

+ (UIColor *)gd_themeColor
{
    return [self gd_radicalRedColor];
}

+ (UIColor *)gd_separatorGray
{
    return [self gd_aLittleGrayColor];
}

+ (UIColor *)gd_darkSeparatorGray
{
    return [self gd_lightGrayColor];
}

+ (UIColor *)gd_backgroundGray
{
    return [self gd_almostWhiteColor];
}

+ (UIColor *)gd_separatorColor
{
    return [self gd_separatorGray];
}

@end




@implementation UIColor (GDTheme)

#pragma mark - black or white

+ (UIColor *)gd_blackColor
{
    return [self gd_colorFromHexRGB:0x333333];
}

+ (UIColor *)gd_darkGrayColor
{
    return [self gd_colorFromHexRGB:0x666666];
}

+ (UIColor *)gd_grayColor
{
    return [self gd_colorFromHexRGB:0x999999];
}

+ (UIColor *)gd_lightGrayColor
{
    return [self gd_colorFromHexRGB:0xcccccc];
}

+ (UIColor *)gd_aLittleGrayColor
{
    return [self gd_colorFromHexRGB:0xe6e6e6];
}

+ (UIColor *)gd_lightLightGrayColor
{
    return [self gd_almostWhiteColor];
}

+ (UIColor *)gd_almostWhiteColor
{
    return [self gd_colorFromHexRGB:0xf2f2f2];
}

+ (UIColor *)gd_whiteColor
{
    return [self whiteColor];
}


#pragma mark - colorful world

+ (UIColor *)gd_radicalRedColor
{
    return [self gd_colorFromHexRGB:0xff4466];
}

+ (UIColor *)gd_yellowColor
{
    return [self gd_colorFromHexRGB:0xffc233];
}

+ (UIColor *)gd_greenColor
{
    return [self gd_colorFromHexRGB:0x00d0c0];
}

+ (UIColor *)gd_blueColor
{
    return [self gd_colorFromHexRGB:0x00aaf1];
}

+ (UIColor *)gd_orangeColor
{
    return [self gd_colorFromHexRGB:0xff9833];
}

@end
