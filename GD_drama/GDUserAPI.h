//
//  GDUserAPI.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDUserAPI : NSObject

+ (void)getSMSCode:(NSString *)phoneNum  complete:( void (^) (NSDictionary *response, BOOL success) )complete;

+ (void)registerWithPhoneNum:(NSString *)phoneNum smsCode:(NSString *)smsCode password:(NSString *)password name:(NSString *)name complete:( void (^) (NSDictionary *response, BOOL success) )complete;

+ (void)loginWithphoneNum:(NSString *)phoneNum password:(NSString *)password complete:( void (^) (NSDictionary *response) )complete;

+ (void)logoutWithComplete:( void (^) (NSDictionary *response, BOOL success) )complete;

+ (void)checkIfLoginWithLoginAction:( void (^) (NSDictionary *response) )loginAction notLoginAction:( void (^) (NSDictionary *response) )notLoginAction;

@end
