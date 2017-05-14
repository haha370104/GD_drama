//
//  GDUser.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDUser.h"

@interface GDUser ()

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userPhoneNum;

@end

@implementation GDUser

- (instancetype)initWithUserName:(NSString *)userName userPhoneNum:(NSString *)userPhoneNum
{
    if ((self = [super init])) {
        _userName = userName;
        _userPhoneNum = userPhoneNum;
    }
    return self;
}

@end
