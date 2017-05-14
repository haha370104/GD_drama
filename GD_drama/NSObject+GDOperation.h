//
//  NSObject+GDTypeCheck_h.h
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GDTypeCheck_h)

// NSDictionary
- (id)gd_safeObjectForKey:(id)key;

// NSMutableDictionary
- (void)gd_setSafeObject:(id)object forSafeKey:(id)key;
- (void)gd_setSafeValue:(id)value forSafeKey:(NSString *)key;

- (void)gd_removeSafeObjectForKey:(id)key;

// NSArray
- (id)gd_safeObjectAtIndex:(NSUInteger)index;
- (id)gd_arrayByAddingSafeObject:(id)object;
- (NSArray *)gd_subarrayWithSafeRange:(NSRange)range;

// NSMutableArray
- (void)gd_addSafeObject:(id)object;
- (void)gd_removeSafeObjectAtIndex:(NSUInteger)index;
- (void)gd_replaceSafeObjectAtIndex:(NSUInteger)index withSafeObject:(id)object;
- (void)gd_removeSafeObject:(id)object;
- (BOOL)gd_containsSafeObject:(id)object;
- (NSUInteger)gd_indexOfSafeObject:(id)object;

// NSString
- (NSString *)gd_safeString:(NSString *)string;
- (NSString *)gd_emptyString:(NSString *)string;
- (NSString *)gd_stringByAppendingSafeString:(NSString *)string;
- (NSString *)gd_stringByReplacingOccurrencesOfSafeString:(NSString *)target withSafeString:(NSString *)replacement;

// NSArray
- (NSArray *)gd_safeArray:(NSArray *)array;

@end
