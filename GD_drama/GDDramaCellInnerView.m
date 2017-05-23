
//
//  GDDramaCellInnerView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaCellInnerView.h"

#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDDramaCellInnerView ()

@property (nonatomic, strong) UIImageView *dramaImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) HCSStarRatingView *starRatingView;

@end

@implementation GDDramaCellInnerView

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self addSubview:self.dramaImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subtitleLabel];
        [self addSubview:self.starRatingView];

        self.backgroundColor = [UIColor whiteColor];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.dramaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(10.0f);
        make.bottom.equalTo(self).with.offset(-10.0f);
        make.height.equalTo(self.dramaImageView.mas_width).multipliedBy(0.9f);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10.0f);
        make.left.equalTo(self.dramaImageView.mas_right).with.offset(20);
    }];

    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.titleLabel);
    }];

    [self.starRatingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subtitleLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.titleLabel);
        make.width.equalTo(self).multipliedBy(0.25f);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
    }];
}

#pragma mark - getter -

- (UIImageView *)dramaImageView
{
    if (!_dramaImageView) {
        _dramaImageView = [[UIImageView alloc] init];
    }
    return _dramaImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont gd_fontOfSize:17];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel
{
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont gd_fontOfSize:14];
        _subtitleLabel.textColor = [UIColor gd_grayColor];
    }
    return _subtitleLabel;
}

- (HCSStarRatingView *)starRatingView
{
    if (!_starRatingView) {
        _starRatingView = [[HCSStarRatingView alloc] init];
        _starRatingView.maximumValue = 5;
        _starRatingView.minimumValue = 0;
        _starRatingView.spacing = 0;
        _starRatingView.allowsHalfStars = YES;
        _starRatingView.userInteractionEnabled = NO;
    }
    return _starRatingView;
}

@end
