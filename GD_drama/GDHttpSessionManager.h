//
//  GDHttpSessionManager.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDHttpSessionManager : NSObject

+ (instancetype)shareManager;


- (void)getRequestByUrl:(NSString *)url params:(NSDictionary *)params success:( void (^) (NSURLSessionDataTask *task, id data) )success
                failure:( void (^) (NSURLSessionDataTask *task, NSDictionary *error) )failure;
- (void)postRequestByUrl:(NSString *)url params:(NSDictionary *)params success:( void (^) (NSURLSessionDataTask *task, id data) )success
                 failure:( void (^) (NSURLSessionDataTask *task, NSDictionary *error) )failure;

@end
