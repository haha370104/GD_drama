//
//  GDDramaTitleInnerView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaTitleInnerView.h"

#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDDramaTitleInnerView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *leftSubtitleLabel;
@property (nonatomic, strong) UILabel *rightSubtitleLabel;

@property (nonatomic, strong) HCSStarRatingView *ratingView;

@end

@implementation GDDramaTitleInnerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor gd_almostWhiteColor];

        [self addSubview:self.titleLabel];
        [self addSubview:self.leftSubtitleLabel];
        [self addSubview:self.rightSubtitleLabel];
        [self addSubview:self.ratingView];

        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(15);
    }];

    [self.leftSubtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.titleLabel);
    }];

    [self.rightSubtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-10);
        make.right.equalTo(self).with.offset(-15);
    }];

    [self.ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel);
        make.right.equalTo(self).with.offset(-15);
        make.width.equalTo(@(80));
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)leftSubtitleLabel
{
    if (!_leftSubtitleLabel) {
        _leftSubtitleLabel = [[UILabel alloc] init];
        _leftSubtitleLabel.font = [UIFont gd_fontOfSize:13];
        _leftSubtitleLabel.textColor = [UIColor gd_grayColor];
    }
    return _leftSubtitleLabel;
}

- (UILabel *)rightSubtitleLabel
{
    if (!_rightSubtitleLabel) {
        _rightSubtitleLabel = [[UILabel alloc] init];
        _rightSubtitleLabel.font = [UIFont gd_fontOfSize:13];
        _rightSubtitleLabel.textColor = [UIColor gd_grayColor];
    }
    return _rightSubtitleLabel;
}

- (HCSStarRatingView *)ratingView
{
    if (!_ratingView) {
        _ratingView = [[HCSStarRatingView alloc] init];
        _ratingView.maximumValue = 5;
        _ratingView.minimumValue = 0;
        _ratingView.spacing = 0;
        _ratingView.backgroundColor = self.backgroundColor;
        _ratingView.allowsHalfStars = YES;
        _ratingView.userInteractionEnabled = NO;
    }
    return _ratingView;
}

@end
