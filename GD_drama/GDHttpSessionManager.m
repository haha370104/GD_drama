//
//  GDHttpSessionManager.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDHttpSessionManager.h"
#import "AFNetworking.h"

#import "MBProgressHUD+GDProgressHUD.h"

#import "GDApiUrls.h"

@interface GDHttpSessionManager ()

@property (nonatomic, strong) AFHTTPSessionManager *session;

@end

@implementation GDHttpSessionManager
#pragma mark - public -

+ (instancetype)shareManager
{
    static GDHttpSessionManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[GDHttpSessionManager alloc] init];
    });

    return _sharedManager;
}

#pragma mark - public -

- (void)getRequestByUrl:(NSString *)url params:(NSDictionary *)params success:( void (^) (NSURLSessionDataTask *task, id data) )success
                failure:( void (^) (NSURLSessionDataTask *task, NSDictionary *error) )failure
{
    MBProgressHUD *loadingView = [MBProgressHUD showLoadingState:@"加载中..." inView:nil inBackground:NO];
    __weak typeof(loadingView) weadHud = loadingView;
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",kGDAPI_HOST,url];
    [self.session GET:requestUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weadHud hide:YES];
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weadHud hide:YES];
        if (failure) {
            NSData* responseData = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            NSDictionary *dictionary = nil;
            if (responseData) {
                dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
            }
            if (dictionary) {
                failure(task, dictionary);
            } else {
                [MBProgressHUD showErrorState:@"网络错误" inView:nil];
                failure(task, nil);
            }
        } else {
            [MBProgressHUD showErrorState:@"未知错误" inView:nil];
        }
    }];
}

- (void)postRequestByUrl:(NSString *)url params:(NSDictionary *)params success:( void (^) (NSURLSessionDataTask *task, id data) )success
                 failure:( void (^) (NSURLSessionDataTask *task, NSDictionary *error) )failure
{
    MBProgressHUD *loadingView = [MBProgressHUD showLoadingState:@"加载中..." inView:nil inBackground:NO];
    __weak typeof(loadingView) weadHud = loadingView;
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",kGDAPI_HOST,url];
    [self.session POST:requestUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weadHud hide:YES];
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weadHud hide:YES];
        if (failure) {
            NSData* responseData = (NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            NSDictionary *dictionary =nil;
            if (responseData) {
                dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
            }
            if (dictionary) {
                failure(task, dictionary);
            } else {
                [MBProgressHUD showErrorState:@"网络错误" inView:nil];
                failure(task, dictionary);
            }
        } else {
            [MBProgressHUD showErrorState:@"未知错误" inView:nil];
        }
    }];
}

#pragma mark - getter && setter -

- (AFHTTPSessionManager *)session
{
    if (!_session) {
        _session = [AFHTTPSessionManager manager];
        _session.responseSerializer = [AFJSONResponseSerializer serializer];
        [_session.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return _session;
}

@end
