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
                                               @"id": @"1",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"2",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"3",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"4",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"5",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             ],
                                     };

        complete(fakeResult, NO);
    }];
}

+ (void)getFavouriteList: (void(^)(NSDictionary *response, BOOL success))complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_GET_FAVOURITE_DRAMA_LIST_URL params:nil success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {

        NSDictionary *fakeResult = @{
                                     @"code": @"200",
                                     @"result": @[
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"1",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"2",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"3",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"4",
                                               @"title":@"生活大爆炸",
                                               @"subtitle":@"xxxxxx",
                                               @"mark":@(4.5)},
                                             @{@"image":@"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                               @"id": @"5",
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

+ (void)getDramaInfo: (NSString *)dramaID complete: (void(^)(NSDictionary *response, BOOL success))complete
{
    [[GDHttpSessionManager shareManager] getRequestByUrl:kGDAPI_GET_DRAMA_INFO_URL params:@{@"dramaID": dramaID} success:^(NSURLSessionDataTask *task, id data) {
        if (complete) {
            complete(data, YES);
        }
    } failure:^(NSURLSessionDataTask *task, NSDictionary *error) {

        NSDictionary *fakeResult = @{
                                     @"code": @"200",
                                     @"result": @[
                                             @{
                                                 @"controlType": @"image",
                                                 @"images": @[
                                                         @"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                                         @"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                                         @"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                                         @"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg",
                                                         @"https://lh6.googleusercontent.com/-SEP_YUUoIOY/AAAAAAAAAAI/AAAAAAAAT4Q/HoHngJXNl-M/photo.jpg"
                                                         ]
                                                 },
                                             @{
                                                 @"controlType": @"title",
                                                 @"title": @"生活大爆炸",
                                                 @"type": @"喜剧",
                                                 @"date": @"2007-09-24",
                                                 @"mark": @(4.5),
                                                 },
                                             @{
                                                 @"controlType": @"meta",
                                                 @"title": @"演员表",
                                                 @"meta": @[
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         @{
                                                             @"charater": @"Penny",
                                                             @"actor": @"Kaley Cuoco"
                                                             },
                                                         ]
                                                 },
                                             @{
                                                 @"controlType": @"download",
                                                 @"title": @"下载区",
                                                 @"items": @[
                                                         @{
                                                             @"title": @"生活大爆炸 S01E01",
                                                             @"content": @"ed2k://|file|生活大爆炸.The.Big.Bang.Theory.S01E01.Chi_Eng.HR-HDTV.AAC.1024X576.x264-YYeTs人人影视.mkv|237406045|6EBA8942D2BE0A10BD2A1C11CDF281E1|h=JS32XQXOWHJICZZXOOV5CLCI26H4ODAO|/",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/59542579.jpg?imageView2/1/w/200/h/200&e=1496074810&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:19oi6ev61rRH5SJiGVzyTO-iaLc=",
                                                             },
                                                         @{
                                                             @"title": @"生活大爆炸 S01E01",
                                                             @"content": @"ed2k://|file|生活大爆炸.The.Big.Bang.Theory.S01E01.Chi_Eng.HR-HDTV.AAC.1024X576.x264-YYeTs人人影视.mkv|237406045|6EBA8942D2BE0A10BD2A1C11CDF281E1|h=JS32XQXOWHJICZZXOOV5CLCI26H4ODAO|/",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/59542579.jpg?imageView2/1/w/200/h/200&e=1496074810&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:19oi6ev61rRH5SJiGVzyTO-iaLc=",
                                                             },
                                                         @{
                                                             @"title": @"生活大爆炸 S01E01",
                                                             @"content": @"ed2k://|file|生活大爆炸.The.Big.Bang.Theory.S01E01.Chi_Eng.HR-HDTV.AAC.1024X576.x264-YYeTs人人影视.mkv|237406045|6EBA8942D2BE0A10BD2A1C11CDF281E1|h=JS32XQXOWHJICZZXOOV5CLCI26H4ODAO|/",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/59542579.jpg?imageView2/1/w/200/h/200&e=1496074810&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:19oi6ev61rRH5SJiGVzyTO-iaLc=",
                                                             },
                                                         @{
                                                             @"title": @"生活大爆炸 S01E01",
                                                             @"content": @"ed2k://|file|生活大爆炸.The.Big.Bang.Theory.S01E01.Chi_Eng.HR-HDTV.AAC.1024X576.x264-YYeTs人人影视.mkv|237406045|6EBA8942D2BE0A10BD2A1C11CDF281E1|h=JS32XQXOWHJICZZXOOV5CLCI26H4ODAO|/",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/59542579.jpg?imageView2/1/w/200/h/200&e=1496074810&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:19oi6ev61rRH5SJiGVzyTO-iaLc=",
                                                             },
                                                         @{
                                                             @"title": @"生活大爆炸 S01E01",
                                                             @"content": @"ed2k://|file|生活大爆炸.The.Big.Bang.Theory.S01E01.Chi_Eng.HR-HDTV.AAC.1024X576.x264-YYeTs人人影视.mkv|237406045|6EBA8942D2BE0A10BD2A1C11CDF281E1|h=JS32XQXOWHJICZZXOOV5CLCI26H4ODAO|/",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/59542579.jpg?attname=download_61.355371900826px_1205412_easyicon.net.png&e=1496074810&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:WC-m1sEHqxkNqL05ivSrZGtAFzM=",
                                                             },
                                                         ],
                                                 },
                                             @{
                                                 @"controlType": @"remark",
                                                 @"title": @"评论区",
                                                 @"items": @[
                                                         @{
                                                             @"title": @"asdfas",
                                                             @"content": @"评论测试1",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/53211210.jpg?attname=reply_all_64px_1182172_easyicon.net.png&e=1496082010&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:wRuF5eur_t8X2t4ppy5S78PXW1k=",
                                                             },
                                                         @{
                                                             @"title": @"asdfas",
                                                             @"content": @"评论测试2",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/53211210.jpg?attname=reply_all_64px_1182172_easyicon.net.png&e=1496082010&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:wRuF5eur_t8X2t4ppy5S78PXW1k=",
                                                             },
                                                         @{
                                                             @"title": @"asdfas",
                                                             @"content": @"评论测试3",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/53211210.jpg?attname=reply_all_64px_1182172_easyicon.net.png&e=1496082010&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:wRuF5eur_t8X2t4ppy5S78PXW1k=",
                                                             },
                                                         @{
                                                             @"title": @"asdfas",
                                                             @"content": @"评论测试4",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/53211210.jpg?attname=reply_all_64px_1182172_easyicon.net.png&e=1496082010&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:wRuF5eur_t8X2t4ppy5S78PXW1k=",
                                                             },
                                                         @{
                                                             @"title": @"asdfas",
                                                             @"content": @"评论测试5",
                                                             @"image": @"http://image.jiantuku.com/17-5-30/53211210.jpg?attname=reply_all_64px_1182172_easyicon.net.png&e=1496082010&token=el7kgPgYzpJoB23jrChWJ2gV3HpRl0VCzFn8rKKv:wRuF5eur_t8X2t4ppy5S78PXW1k=",
                                                             },
                                                         ],
                                                 },
                                             ]
                                     };

        complete(fakeResult, NO);
    }];
}

@end
