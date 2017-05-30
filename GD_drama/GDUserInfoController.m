//
//  GDUserInfoController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDUserInfoController.h"

#import "GDUserManager.h"

#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDUserInfoController ()

@property (nonatomic, strong) UIImageView *userAvatar;
@property (nonatomic, strong) UILabel *userNameLabel;

@property (nonatomic, strong) UIButton *confirmPackage;
@property (nonatomic, strong) UIButton *passingPackage;
@property (nonatomic, strong) UIButton *historyPackage;
@property (nonatomic, strong) UIButton *logoutImageView;

@end

@implementation GDUserInfoController

#pragma mark - init -

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view addSubview:self.userAvatar];
        [self.view addSubview:self.userNameLabel];

        [self.view addSubview:self.confirmPackage];
        [self.view addSubview:self.passingPackage];
        [self.view addSubview:self.historyPackage];
        [self.view addSubview:self.logoutImageView];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - lifecycle -

- (void)viewDidLoad
{
    self.userNameLabel.text = [GDUserManager shareManager].user.userName;
}

#pragma mark - action -

- (void)checkConfirmOrder:(UIButton *)sender
{

}

- (void)checkPassingOrder:(UIButton *)sender
{

}

- (void)checkFinishedOrder:(UIButton *)sender
{

}

- (void)logout:(UIButton *)sender
{

}

#pragma mark - private -

- (void)setupConstraints
{
    [self.userAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.equalTo(self.userAvatar.mas_width);
        make.width.equalTo(self.view).multipliedBy(0.3f);
        make.top.equalTo(self.view).with.offset(84);
    }];

    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userAvatar.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view);
    }];

    [self.confirmPackage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(self.view.mas_width).multipliedBy(0.25f);
        make.left.equalTo(self.view).with.offset(50);
        make.top.equalTo(self.userAvatar.mas_bottom).with.offset(80);
    }];

    [self.passingPackage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.confirmPackage);
        make.width.height.equalTo(self.confirmPackage);
        make.right.equalTo(self.view).with.offset(-50);
    }];

    [self.historyPackage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.confirmPackage);
        make.width.height.equalTo(self.confirmPackage);
        make.top.equalTo(self.confirmPackage.mas_bottom).with.offset(80);
    }];

    [self.logoutImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.passingPackage);
        make.centerY.equalTo(self.historyPackage);
        make.width.height.equalTo(self.confirmPackage);
    }];
}

#pragma mark - getter && setter -

- (UIImageView *)userAvatar
{
    if (!_userAvatar) {
        _userAvatar = [[UIImageView alloc] init];
        _userAvatar.image = [UIImage imageNamed:@"man_avatar"];
    }
    return _userAvatar;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textColor = [UIColor gd_grayColor];
        _userNameLabel.font = [UIFont gd_fontOfSize:14];
    }
    return _userNameLabel;
}

- (UIButton *)confirmPackage
{
    if (!_confirmPackage) {
        _confirmPackage = [[UIButton alloc] init];
        [_confirmPackage setBackgroundImage:[UIImage imageNamed:@"favourite"] forState:UIControlStateNormal];
        [_confirmPackage setTitle:@"我的喜欢" forState:UIControlStateNormal];
        [_confirmPackage setTitleColor:[UIColor gd_grayColor] forState:UIControlStateNormal];
        [_confirmPackage setTitleEdgeInsets:UIEdgeInsetsMake(130, 0, 0, 0)];
        _confirmPackage.titleLabel.font = [UIFont gd_fontOfSize:14];

        [_confirmPackage addTarget:self action:@selector(checkConfirmOrder:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmPackage;
}

- (UIButton *)passingPackage
{
    if (!_passingPackage) {
        _passingPackage = [[UIButton alloc] init];
        [_passingPackage setBackgroundImage:[UIImage imageNamed:@"user_star"] forState:UIControlStateNormal];
        [_passingPackage setTitle:@"我的评分" forState:UIControlStateNormal];
        [_passingPackage setTitleColor:[UIColor gd_grayColor] forState:UIControlStateNormal];
        [_passingPackage setTitleEdgeInsets:UIEdgeInsetsMake(130, 0, 0, 0)];
        _passingPackage.titleLabel.font = [UIFont gd_fontOfSize:14];

        [_passingPackage addTarget:self action:@selector(checkPassingOrder:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _passingPackage;
}

- (UIButton *)historyPackage
{
    if (!_historyPackage) {
        _historyPackage = [[UIButton alloc] init];
        [_historyPackage setBackgroundImage:[UIImage imageNamed:@"remark"] forState:UIControlStateNormal];
        [_historyPackage setTitle:@"我的评论" forState:UIControlStateNormal];
        [_historyPackage setTitleColor:[UIColor gd_grayColor] forState:UIControlStateNormal];
        [_historyPackage setTitleEdgeInsets:UIEdgeInsetsMake(130, 0, 0, 0)];
        _historyPackage.titleLabel.font = [UIFont gd_fontOfSize:14];

        [_historyPackage addTarget:self action:@selector(checkFinishedOrder:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _historyPackage;
}

- (UIButton *)logoutImageView
{
    if (!_logoutImageView) {
        _logoutImageView = [[UIButton alloc] init];
        [_logoutImageView setBackgroundImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
        [_logoutImageView setTitle:@"登出" forState:UIControlStateNormal];
        [_logoutImageView setTitleColor:[UIColor gd_grayColor] forState:UIControlStateNormal];
        [_logoutImageView setTitleEdgeInsets:UIEdgeInsetsMake(130, 0, 0, 0)];
        _logoutImageView.titleLabel.font = [UIFont gd_fontOfSize:14];

        [_logoutImageView addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutImageView;
}

@end
