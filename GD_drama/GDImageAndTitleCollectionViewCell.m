//
//  GDImageAndTitleCollectionViewCell.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/15.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDImageAndTitleCollectionViewCell.h"

#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDImageAndTitleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *upImageView;
@property (nonatomic, strong) UILabel *downLabel;

@end

@implementation GDImageAndTitleCollectionViewCell

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self.contentView addSubview:self.upImageView];
        [self.contentView addSubview:self.downLabel];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10);
        make.centerX.equalTo(self.contentView);
    }];

    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upImageView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
}

#pragma mark - getter -

- (UIImageView *)upImageView
{
    if (!_upImageView) {
        _upImageView = [[UIImageView alloc] init];
    }
    return _upImageView;
}

- (UILabel *)downLabel
{
    if (!_downLabel) {
        _downLabel = [[UILabel alloc] init];
        _downLabel.font = [UIFont gd_fontOfSize:13];
    }

    return _downLabel;
}

@end
