//
//  GDDramaInfoCellInnerView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaInfoCellInnerView.h"
#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"
#import <Masonry/Masonry.h>

@interface GDDramaInfoCellInnerView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *rightImage;

@end

@implementation GDDramaInfoCellInnerView

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.rightImage];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(15);
    }];

    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.width.equalTo(self).multipliedBy(0.7f);
        make.left.equalTo(self.titleLabel);
    }];

    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(self.rightImage.mas_height);
        make.height.equalTo(self).multipliedBy(0.5f);
        make.right.equalTo(self).with.offset(-15);
    }];
}

#pragma mark - getter -

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont gd_fontOfSize:13];
        _titleLabel.textColor = [UIColor gd_darkGrayColor];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont gd_fontOfSize:12];
        _contentLabel.numberOfLines = 2;
        _contentLabel.textColor = [UIColor gd_grayColor];
    }
    return _contentLabel;
}

- (UIButton *)rightImage
{
    if (!_rightImage) {
        _rightImage = [[UIButton alloc] init];
    }
    return _rightImage;
}

@end
