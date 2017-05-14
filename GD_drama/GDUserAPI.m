//
//  GDUserAPI.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDUserAPI.h"
#import "GDHttpSessionManager.h"
#import "GDApiUrls.h"

#import "MBProgressHUD+GDProgressHUD.h"
#import "NSObject+GDTypeCheck.h"

@implementation GDUserAPI

+ (void)getSMSCode:(NSString *)phoneNum  complete:( void (^) (NSDictionary *response, BOOL success) )complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_GET_SMS_CODE_URL params:@{@"mobile":phoneNum} success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        if (complete) {
            complete(error, NO);
        }
    }];
}

+ (void)registerWithPhoneNum:(NSString *)phoneNum smsCode:(NSString *)smsCode password:(NSString *)password name:(NSString *)name complete:( void (^) (NSDictionary *response, BOOL success) )complete
{
    [[GDHttpSessionManager shareManager] postRequestByUrl:kGDAPI_REGISTER_URL params:@{@"mobile":phoneNum, @"smsCode":smsCode, @"password":password, @"name":name} success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        if (complete) {
            complete(error, NO);
        }
    }];
}

+ (void)loginWithphoneNum:(NSString *)phoneNum password:(NSString *)password complete:( void (^) (NSDictionary *response) )complete
{
    [[GDHttpSessionManager shareManager] postRequestByUrl:kGDAPI_LOGIN_URL params:@{@"mobile":phoneNum, @"password":password} success:^(NSURLSessionDataTask *task, id data) {
        NSAssert([data isKindOfClass:[NSDictionary class]],@"response is not kind of dictionary");
        complete(data);
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        [MBProgressHUD showErrorState:[error stringValueForKey:@"error"] inView:nil];
    }];
}

+ (void)logoutWithComplete:( void (^) (NSDictionary *response, BOOL success) )complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_LOGOUT_URL params:nil success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        complete(error, NO);
    }];
}

+ (void)checkIfLoginWithLoginAction:( void (^) (NSDictionary *response) )loginAction notLoginAction:( void (^) (NSDictionary *response) )notLoginAction
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_CHECK_LOGIN_URL params:nil success:^(NSURLSessionDataTask *task, id data) {
        NSDictionary *result = [data dictionaryValueForKey:@"result"];
//        [[DPUserManager shareManager] setupWithPhoneNum:[result stringValueForKey:@"mobile"] userName:[result stringValueForKey:@"name"]];
        loginAction(data);
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        notLoginAction(error);
    }];
}

@end
