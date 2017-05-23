//
//  GDDramaAPI.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/15.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDDramaAPI : NSObject

+ (void)getHomePage:(void(^)(NSDictionary *response, BOOL success))complete;
+ (void)getDramaList: (NSString *)url complete: (void(^)(NSDictionary *response, BOOL success))complete;
+ (void)getDownloadList: (void(^)(NSDictionary *response, BOOL success))complete;

@end
