//
//  GDTabBarController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDMainPageController.h"
#import "GDDownloadController.h"
#import "GDMyFavoriteController.h"
#import "GDUserInfoController.h"

@interface GDTabBarController ()

@end

@implementation GDTabBarController

#pragma mark - lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarItem];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - private -

- (void)setupTabBarItem
{
    GDMainPageController *mainController = [[GDMainPageController alloc] init];
    mainController.tabBarItem.title = @"首页";
    mainController.tabBarItem.image = [UIImage imageNamed:@"home"];

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

    self.viewControllers = @[mainController, downloadNavigationController, favoriteNavigationController, userInfoController];
}

@end
