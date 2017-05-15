//
//  GDDramaAPI.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/15.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaAPI.h"
#import "GDHttpSessionManager.h"
#import "GDApiUrls.h"

@implementation GDDramaAPI

+ (void)getHomePage:(void(^)(NSDictionary *response, BOOL success))complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_GET_HOME_PAGE_URL params:nil success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {
        complete(error, NO);
    }];
}

@end
