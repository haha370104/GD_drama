//
//  NSObject+GDOperation.m
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "NSObject+GDTypeCheck.h"
#import "NSObject+GDOperation.h"

@implementation NSObject (GDOperation)

- (BOOL)boolValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }

    if ([value isKindOfClass:[NSNumber class]]) {
        return [value intValue];
    }

    if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"0"] ||
            [value isEqualToString:@"false"] ||
            [value isEqualToString:@"null"]) {
            return NO;
        } else {
            return YES;
        }
    }

    return NO;
}

- (NSString *)stringValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }

    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }

    NSAssert(!value || [value isKindOfClass:[NSString class]], @"value is not NSString class!");

    return nil;
}

- (NSArray *)arrayValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }

    return nil;
}

- (NSDictionary *)dictionaryValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }

    return nil;
}

- (NSNumber *)numberValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }

    if ([value isKindOfClass:[NSString class]]) {
        return @([value doubleValue]);
    }

    return nil;
}

- (NSUInteger)integerValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSNumber class]]) {
        return [[value stringValue] intValue];
    }

    if ([value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    
    return 0;
}

- (CGFloat)floatValueForKey:(NSString *)key
{
    id value = [self gd_safeObjectForKey:key];

    if ([value isKindOfClass:[NSNumber class]]) {
        return [[value stringValue] doubleValue];
    }

    if ([value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }

    return 0;
}

@end
