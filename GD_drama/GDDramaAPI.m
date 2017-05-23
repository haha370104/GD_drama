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

+ (void)getDramaList: (NSString *)url complete: (void(^)(NSDictionary *response, BOOL success))complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:url params:nil success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {

        NSDictionary *fakeResult = @{
                                     @"code": @"200",
                                     @"result": @[
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             ],
                                     };

        complete(fakeResult, NO);
    }];
}

+ (void)getDownloadList: (void(^)(NSDictionary *response, BOOL success))complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_GET_DOWNLOAD_LIST_URL params:nil success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {

        NSDictionary *fakeResult = @{
                                     @"code": @"200",
                                     @"result": @[
                                             @{@"progress":@(0.113f),
                                               @"title":@"生活大爆炸 The Big Bang of Theory S10E01 中英字幕 HDTVrip.1024x576",
                                               @"subtitle":@"2017-05-30 | 175.8MB"},
                                             @{@"progress":@(0.113f),
                                               @"title":@"生活大爆炸 The Big Bang of Theory S10E01 中英字幕 HDTVrip.1024x576",
                                               @"subtitle":@"2017-05-30 | 175.8MB"},
                                             @{@"progress":@(0.113f),
                                               @"title":@"生活大爆炸 The Big Bang of Theory S10E01 中英字幕 HDTVrip.1024x576",
                                               @"subtitle":@"2017-05-30 | 175.8MB"},
                                             @{@"progress":@(0.113f),
                                               @"title":@"生活大爆炸 The Big Bang of Theory S10E01 中英字幕 HDTVrip.1024x576",
                                               @"subtitle":@"2017-05-30 | 175.8MB"},
                                             @{@"progress":@(0.113f),
                                               @"title":@"生活大爆炸 The Big Bang of Theory S10E01 中英字幕 HDTVrip.1024x576",
                                               @"subtitle":@"2017-05-30 | 175.8MB"},
                                             ],
                                     };

        complete(fakeResult, NO);
    }];
}


@end
