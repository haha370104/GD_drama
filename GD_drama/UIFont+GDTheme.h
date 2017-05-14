//
//  UIFont+GDTheme.h
//  Baixing
//
//  Created by hyice on 15/8/19.
//  Copyright (c) 2015年 Baixing. All rights reserved.
//

@import UIKit;


@interface UIFont (GDTheme)

+ (UIFont *)gd_systemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)gd_boldSystemFontOfSize:(CGFloat)fontSize;
// Returns an instance of the font associated with the text style and scaled appropriately for the user's selected content size category. See UIFontDescriptor.h for the complete list.

+ (UIFont *)gd_fontOfSize:(CGFloat)fontSize;
+ (UIFont *)gd_preferredFontForTextStyle:(NSString *)textStyle;
+ (UIFont *)gd_fontForTitle1;
+ (UIFont *)gd_fontForTitle2;
+ (UIFont *)gd_fontForTitle3;
+ (UIFont *)gd_fontForHeadline;
+ (UIFont *)gd_fontForSubheadline;
+ (UIFont *)gd_fontForBody;
+ (UIFont *)gd_fontForCallout;
+ (UIFont *)gd_fontForFootnote;
+ (UIFont *)gd_fontForCaption1;
+ (UIFont *)gd_fontForCaption2;

@end
