//
//  GDApiUrls.m
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kGDAPI_HOST @"http://ant-express.picfood.cn"

#pragma mark - 用户相关 -

#define kGDAPI_GET_SMS_CODE_URL @"/api/user/getSMSCode"
#define kGDAPI_REGISTER_URL @"/api/user/signup"
#define kGDAPI_LOGIN_URL @"/api/user/login"
#define kGDAPI_LOGOUT_URL @"/api/user/logout"
#define kGDAPI_CHECK_LOGIN_URL @"/api/user/info"

#pragma mark - 包裹相关 -

#define kGDAPI_SEARCH_PACKAGE_URL @"/api/parcel/path/search"
#define kGDAPI_CONFIRM_PACKAGE_URL @"/api/parcel/path/confirm"
#define kGDAPI_GET_ORDER @"/api/order"

#pragma mark - 订单相关 -

#define kGDAPI_GET_CONFIRM_ORDER_URL @"/api/order/confirmed"
#define kGDAPI_GET_PASSING_ORDER_URL @"/api/order/passing"
#define kGDAPI_GET_FINISHED_ORDER_URL @"/api/order/finished"