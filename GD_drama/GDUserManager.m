//
//  GDUserManager.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDUserManager.h"

@interface GDUserManager ()

@property (nonatomic, strong) GDUser *user;

@end

@implementation GDUserManager

+ (instancetype)shareManager
{
    static GDUserManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[GDUserManager alloc] init];
    });

    return _sharedManager;
}

- (void)setupWithPhoneNum:(NSString *)phoneNum userName:(NSString *)userName
{
    self.user = [[GDUser alloc] initWithUserName:userName userPhoneNum:phoneNum];
}

@end
