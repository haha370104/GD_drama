//
//  UIFont+GDTheme.m
//  Baixing
//
//  Created by hyice on 15/8/19.
//  Copyright (c) 2015年 Baixing. All rights reserved.
//

#import "UIFont+GDTheme.h"


@implementation UIFont (GDTheme)

#pragma mark - Public

+ (UIFont *)gd_fontOfSize:(CGFloat)fontSize
{
    CGFloat offset = fontSize - 14.0f;
    return [self gd_fontWithSizeOffset:offset];
}

+ (UIFont *)gd_systemFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)gd_boldSystemFontOfSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fontSize];
}

+ (UIFont *)gd_preferredFontForTextStyle:(NSString *)textStyle
{
    if ([textStyle isEqualToString:UIFontTextStyleTitle1]) {
        return [self gd_fontForTitle1];
    } else if ([textStyle isEqualToString:UIFontTextStyleTitle2]) {
        return [self gd_fontForTitle2];
    } else if ([textStyle isEqualToString:UIFontTextStyleTitle3]) {
        return [self gd_fontForTitle3];
    } else if ([textStyle isEqualToString:UIFontTextStyleHeadline]) {
        return [self gd_fontForHeadline];
    } else if ([textStyle isEqualToString:UIFontTextStyleSubheadline]) {
        return [self gd_fontForSubheadline];
    } else if ([textStyle isEqualToString:UIFontTextStyleCallout]) {
        return [self gd_fontForCallout];
    } else if ([textStyle isEqualToString:UIFontTextStyleFootnote]) {
        return [self gd_fontForFootnote];
    } else if ([textStyle isEqualToString:UIFontTextStyleCaption1]) {
        return [self gd_fontForCaption1];
    } else if ([textStyle isEqualToString:UIFontTextStyleCaption2]) {
        return [self gd_fontForCaption2];
    } else if ([textStyle isEqualToString:UIFontTextStyleBody]) {
        return [self gd_fontForBody];
    } else {
        return [self gd_fontForBody];
    }
}

+ (UIFont *)gd_fontForTitle1
{
    return [self gd_fontWithSizeOffset:4.0f];
}

+ (UIFont *)gd_fontForTitle2
{
    return [self gd_fontWithSizeOffset:2.0f];
}

+ (UIFont *)gd_fontForTitle3
{
    return [self gd_fontWithSizeOffset:1.0f];
}

+ (UIFont *)gd_fontForHeadline
{
    return [self gd_fontForTitle2];
}

+ (UIFont *)gd_fontForSubheadline
{
    return [self gd_fontForTitle3];
}

+ (UIFont *)gd_fontForBody
{
    return [self gd_fontWithSizeOffset:0];
}

+ (UIFont *)gd_fontForCallout
{
    return [self gd_fontWithSizeOffset:-2.0f];
}

+ (UIFont *)gd_fontForFootnote
{
    return [self gd_fontWithSizeOffset:-3.0f];
}

+ (UIFont *)gd_fontForCaption1
{
    return [self gd_fontWithSizeOffset:-1.0f];
}

+ (UIFont *)gd_fontForCaption2
{
    return [self gd_fontWithSizeOffset:-2.0f];
}

#pragma mark - Private

+ (CGFloat)gd_baseFontSize
{
    static CGFloat baseFontSize = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        if (screenWidth > 375.0f) {
            baseFontSize = 14.0f;
        } else if (screenWidth > 320.0f) {
            baseFontSize = 14.0f;
        } else {
            baseFontSize = 12.0f;
        }
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            baseFontSize = 20.0f;
        }
    });
    return baseFontSize;
}

+ (CGFloat)gd_fontSizeOffsetRatio
{
    static CGFloat offsetRatio = 1.0f;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            offsetRatio = 2.0f;
        } else {
            offsetRatio = 1.0f;
        }
    });
    return offsetRatio;
}

+ (UIFont *)gd_fontWithSizeOffset:(CGFloat)offset
{
    CGFloat fontSize = [self gd_baseFontSize] + [self gd_fontSizeOffsetRatio] * offset;
    return [self systemFontOfSize:fontSize];
}

@end
