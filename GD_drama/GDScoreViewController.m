//
//  GDScoreViewController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/30.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDScoreViewController.h"

#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"
#import "MBProgressHUD+GDProgressHUD.h"

#import <HCSStarRatingView/HCSStarRatingView.h>
#import <Masonry/Masonry.h>

@interface GDScoreViewController ()

@property (nonatomic, copy) NSString *dramaID;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) HCSStarRatingView *ratingView;
@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation GDScoreViewController

#pragma mark - init -

- (instancetype)initWithDramaID:(NSString *)dramaID
{
    if ((self = [super init])) {
        self.dramaID = dramaID;
        self.view.backgroundColor = [UIColor gd_whiteColor];

        [self.view addSubview:self.closeButton];
        [self.view addSubview:self.titleLabel];
        [self.view addSubview:self.ratingView];
        [self.view addSubview:self.confirmButton];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(self.view).with.offset(20);
        make.width.height.equalTo(@(30));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).with.offset(-50);
    }];

    [self.ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(40);
        make.width.equalTo(self.view).multipliedBy(0.3f);
    }];

    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.ratingView.mas_bottom).with.offset(20);
    }];
}

#pragma mark - event -

- (void)closeButtonClick: (id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmButtonClick: (id)sender
{
    [MBProgressHUD showSuccessState:@"打分成功！" inView:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter -

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] init];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"点击星星评分";

        _titleLabel.font = [UIFont gd_fontOfSize:12];
        _titleLabel.textColor = [UIColor gd_lightGrayColor];
    }
    return _titleLabel;
}

- (HCSStarRatingView *)ratingView
{
    if (!_ratingView) {
        _ratingView = [[HCSStarRatingView alloc] init];
        _ratingView.maximumValue = 5;
        _ratingView.minimumValue = 0;
        _ratingView.spacing = 0;
        _ratingView.allowsHalfStars = YES;
    }
    return _ratingView;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [[UIButton alloc] init];
        [_confirmButton setTitle:@"确认评分" forState:UIControlStateNormal];
        _confirmButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        _confirmButton.titleLabel.font = [UIFont gd_fontOfSize:13];
        [_confirmButton setTitleColor:[UIColor gd_yellowColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        _confirmButton.titleEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
        _confirmButton.layer.borderColor = [[UIColor gd_yellowColor] CGColor];
        _confirmButton.layer.borderWidth = 0.5f;
        _confirmButton.titleLabel.clipsToBounds = YES;
    }
    return _confirmButton;
}

@end
