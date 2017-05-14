//
//  GDUser.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDUser : NSObject

@property (nonatomic, copy, readonly) NSString *userName;
@property (nonatomic, copy, readonly) NSString *userPhoneNum;

- (instancetype)initWithUserName:(NSString *)userName userPhoneNum:(NSString *)userPhoneNum;

@end
