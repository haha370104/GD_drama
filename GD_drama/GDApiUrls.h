//
//  GDApiUrls.m
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kGDAPI_HOST @"xxxxx"

#pragma mark - 用户相关 -

#define kGDAPI_GET_SMS_CODE_URL @"/api/user/getSMSCode"
#define kGDAPI_REGISTER_URL @"/api/user/signup"
#define kGDAPI_LOGIN_URL @"/api/user/login"
#define kGDAPI_LOGOUT_URL @"/api/user/logout"
#define kGDAPI_CHECK_LOGIN_URL @"/api/user/info"

#pragma mark - 影片相关 -

#define kGDAPI_GET_HOME_PAGE_URL @"/api/drama/getHomePage"
#define kGDAPI_GET_DOWNLOAD_LIST_URL @"/api/drama/getDownloadList"
#define kGDAPI_GET_DRAMA_INFO_URL @"/api/drama/getDramaInfo"
#define kGDAPI_GET_FAVOURITE_DRAMA_LIST_URL @"/api/drama/getFavouriteDramaList"
