//
//  GDUserManager.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDUser.h"

@interface GDUserManager : NSObject

@property (nonatomic, strong, readonly) GDUser *user;

+ (instancetype)shareManager;
- (void)setupWithPhoneNum:(NSString *)phoneNum userName:(NSString *)userName;

@end
