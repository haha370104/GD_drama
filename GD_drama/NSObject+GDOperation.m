//
//  NSObject+GDTypeCheck_h.m
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "NSObject+GDOperation.h"

@implementation NSObject (GDTypeCheck_h)

/*** NSDictionary ***/
- (id)gd_safeObjectForKey:(id)key
{
    NSAssert([self isKindOfClass:[NSDictionary class]], @"object is not an dictionary");

    if (NO == [self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }

    id object = [(NSDictionary *)self objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }

    return object;
}

/*** NSMutableDictionary ***/
- (void)gd_setSafeObject:(id)object forSafeKey:(id)key
{
    NSAssert([self isKindOfClass:[NSDictionary class]], @"object is not an dictionary");

    if (NO == [self isKindOfClass:[NSMutableDictionary class]]) {
        return;
    }

    if (nil == key || nil == object) {
        return;
    }

    [(NSMutableDictionary *)self setObject:object forKey:key];
}

- (void)gd_setSafeValue:(id)value forSafeKey:(NSString *)key
{
    [self gd_setSafeObject:value forSafeKey:key];
}

- (void)gd_removeSafeObjectForKey:(id)key
{
    if (NO == [self isKindOfClass:[NSMutableDictionary class]]) {
        return;
    }
    if (nil == key) {
        return;
    }
    [(NSMutableDictionary *)self removeObjectForKey:key];
}

/*** NSArray ***/
- (id)gd_safeObjectAtIndex:(NSUInteger)index
{
    NSAssert([self isKindOfClass:[NSArray class]], @"object is not an array");

    NSUInteger emptysize = 0;

    if (NO == [self isKindOfClass:[NSArray class]]) {
        return nil;
    }

    if (emptysize > index || index >= [(NSArray *)self count]) {
        return nil;
    }

    id object = [(NSArray *)self objectAtIndex:index];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }

    return object;
}

- (id)gd_arrayByAddingSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]], @"object is not an array");

    if (NO == [self isKindOfClass:[NSArray class]]) {
        return nil;
    }

    if (nil == object) {
        return self;
    }

    return [(NSArray *)self arrayByAddingObject:object];
}

- (NSArray *)gd_subarrayWithSafeRange:(NSRange)range
{
    if (NO == [self isKindOfClass:[NSArray class]]) {
        return nil;
    }

    if ( (range.location + range.length) > ((NSArray *)self).count ) {
        NSUInteger length = ((NSArray *)self).count - range.location;
        return [(NSArray *)self subarrayWithRange:NSMakeRange(range.location, length)];
    }

    return [(NSArray *)self subarrayWithRange:range];
}

/*** NSMutableArray || Set***/
- (void)gd_addSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSSet class]], @"object is not an array or set");

    if (NO == [self isKindOfClass:[NSMutableArray class]] && NO == [self isKindOfClass:[NSMutableSet class]]) {
        return;
    }

    if (nil == object) {
        return;
    }

    if ([self isKindOfClass:[NSMutableArray class]]) {
        [(NSMutableArray *)self addObject:object];
    }
    else if ([self isKindOfClass:[NSMutableSet class]]) {
        [(NSMutableSet *)self addObject:object];
    }
}

- (void)gd_removeSafeObjectAtIndex:(NSUInteger)index
{
    NSAssert([self isKindOfClass:[NSArray class]], @"object is not an array");

    NSUInteger emptysize = 0;

    if (NO == [self isKindOfClass:[NSMutableArray class]]) {
        return;
    }

    if (index < emptysize || index >= [(NSMutableArray *)self count]) {
        return;
    }

    [(NSMutableArray *)self removeObjectAtIndex:index];
}

- (void)gd_removeSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSSet class]], @"object is not an array or set");

    if (NO == [self isKindOfClass:[NSMutableArray class]] && NO == [self isKindOfClass:[NSMutableSet class]]) {
        return;
    }

    if (nil == object) {
        return;
    }

    if ([self isKindOfClass:[NSMutableArray class]]) {
        [(NSMutableArray *)self removeObject:object];
    }
    else if ([self isKindOfClass:[NSMutableSet class]]) {
        [(NSMutableSet *)self removeObject:object];
    }
}

- (BOOL)gd_containsSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSSet class]], @"object is not an array or set");

    if (NO == [self isKindOfClass:[NSArray class]] && NO == [self isKindOfClass:[NSSet class]]) {
        return NO;
    }

    if (nil == object) {
        return NO;
    }

    if ([self isKindOfClass:[NSArray class]]) {
        return [(NSArray *)self containsObject:object];
    }
    else if ([self isKindOfClass:[NSSet class]]) {
        return [(NSSet *)self containsObject:object];
    }
    return NO;
}

- (NSUInteger)gd_indexOfSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]], @"object is not an array");

    if (NO == [self isKindOfClass:[NSMutableArray class]]) {
        return -1;
    }

    if (nil == object) {
        return -1;
    }

    return [(NSMutableArray *)self indexOfObject:object];
}

- (void)gd_replaceSafeObjectAtIndex:(NSUInteger)index withSafeObject:(id)object
{
    NSAssert([self isKindOfClass:[NSArray class]], @"object is not an array");

    NSUInteger emptysize = 0;

    if (NO == [self isKindOfClass:[NSMutableArray class]]) {
        return;
    }

    if (index < emptysize || index >= [(NSMutableArray *)self count]) {
        return;
    }

    if (nil == object) {
        return;
    }

    [(NSMutableArray *)self replaceObjectAtIndex:index withObject:object];
}

/*** NSString ***/
- (NSString *)gd_safeString:(NSString *)string
{
    return string ?: @"";
}

- (NSArray *)gd_safeArray:(NSArray *)array
{
    return array ?: @[];
}

- (NSString *)gd_emptyString:(NSString *)string
{
    if ( string == nil || string.length == 0 ) {
        return @"0";
    }

    return string;
}

- (NSString *)gd_stringByAppendingSafeString:(NSString *)string
{
    if ( [self isKindOfClass:[NSString class]] == NO ) {
        return nil;
    }

    if ( string == nil || string.length == 0 ) {
        return (NSString *)self;
    }

    return [(NSString *)self stringByAppendingString:string];
}

- (NSString *)gd_stringByReplacingOccurrencesOfSafeString:(NSString *)target withSafeString:(NSString *)replacement
{
    if ( [self isKindOfClass:[NSString class]] == NO ) {
        return nil;
    }

    if ( target == nil || replacement == nil ) {
        return (NSString *)self;
    }

    return [(NSString *)self stringByReplacingOccurrencesOfString:target withString:replacement];
}

@end
