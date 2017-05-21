//
//  GDTabBarController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDHomePageController.h"
#import "GDDownloadController.h"
#import "GDMyFavoriteController.h"
#import "GDUserInfoController.h"
#import "GDLoginController.h"

#import "GDUserManager.h"
#import "GDDramaAPI.h"
#import "NSObject+GDTypeCheck.h"
#import "NSObject+GDOperation.h"

#import "MBProgressHUD+GDProgressHUD.h"

@interface GDTabBarController ()

@end

@implementation GDTabBarController

#pragma mark - lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarItem];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![GDUserManager shareManager].user) {
        GDLoginController *loginController = [[GDLoginController alloc] init];
        UINavigationController *loginNavigationController = [[UINavigationController alloc] initWithRootViewController:loginController];
        loginNavigationController.navigationBar.topItem.title = @"登陆";
//        [self presentViewController:loginNavigationController animated:YES completion:^{
//            [MBProgressHUD showErrorState:@"请先登录!" inView:nil];
//        }];
    }
}

#pragma mark - private -

- (void)setupTabBarItem
{
    GDHomePageController *mainController = [[GDHomePageController alloc] init];
    mainController.tabBarItem.title = @"首页";
    mainController.tabBarItem.image = [UIImage imageNamed:@"home"];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
    mainNavigationController.navigationBar.topItem.title = @"首页";

    GDDownloadController *downloadController = [[GDDownloadController alloc] init];
    downloadController.tabBarItem.title = @"下载";
    downloadController.tabBarItem.image = [UIImage imageNamed:@"download"];
    UINavigationController *downloadNavigationController = [[UINavigationController alloc] initWithRootViewController:downloadController];
    downloadNavigationController.navigationBar.topItem.title = @"远程下载";

    GDMyFavoriteController *favoriteController = [[GDMyFavoriteController alloc] init];
    favoriteController.tabBarItem.title = @"喜欢";
    favoriteController.tabBarItem.image = [UIImage imageNamed:@"favorite"];
    UINavigationController *favoriteNavigationController = [[UINavigationController alloc] initWithRootViewController:favoriteController];
    favoriteNavigationController.navigationBar.topItem.title = @"我的喜欢";

    GDUserInfoController *userInfoController = [[GDUserInfoController alloc] init];
    userInfoController.tabBarItem.title = @"我的";
    userInfoController.tabBarItem.image = [UIImage imageNamed:@"userinfo"];


    [GDDramaAPI getHomePage:^(NSDictionary *response, BOOL success) {
        if (success) {
            mainController.categoryList = [[response dictionaryValueForKey:@"result"] gd_safeObjectAtIndex:0];
        } else {
            mainController.categoryList = @[
                                            @{@"title" : @"喜剧",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"恐怖",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"惊悚",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"剧情",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"动作",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"科幻",
                                              @"image":@"xxxx"},
                                            @{@"title" : @"悬疑",
                                              @"image":@"xxxx"},
                                            ];
            mainController.bannerImageList = @[
                                               @{@"image":@"http://i4.buimg.com/588926/0b4ea16d6b1f2de1.png",
                                                 @"url":@"http://www.baidu.com"},
                                               @{@"image":@"http://i2.muimg.com/588926/4ee887aff87a8a06.png",
                                                 @"url":@"http://www.baidu.com"},
                                               @{@"image":@"http://i4.buimg.com/588926/b6042130c879a7d4.png",
                                                 @"url":@"http://www.baidu.com"},
                                               @{@"image":@"http://i2.muimg.com/588926/b4dc0b39f1692197.png",
                                                 @"url":@"http://www.baidu.com"},
                                               @{@"image":@"http://i4.buimg.com/588926/6b9bbe19cf5c722a.png",
                                                 @"url":@"http://www.baidu.com"},
                                               ];
        }
    }];

    self.viewControllers = @[mainNavigationController, downloadNavigationController, favoriteNavigationController, userInfoController];
}

@end
