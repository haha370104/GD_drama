//
//  GDDownloadTableViewCell.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDownloadTableViewCell.h"
#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDDownloadTableViewCell ()

@property (nonatomic, strong) UILabel *dramaTitleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UCZProgressView *progressView;

@end

@implementation GDDownloadTableViewCell

#pragma mark - init -

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self.contentView addSubview:self.progressView];
        [self.contentView addSubview:self.dramaTitleLabel];
        [self.contentView addSubview:self.subtitleLabel];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).with.offset(10);
        make.bottom.equalTo(self.contentView).with.offset(-10);
        make.width.equalTo(self.progressView.mas_height);
    }];

    [self.dramaTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.progressView.mas_right).with.offset(15);
        make.right.equalTo(self.contentView).with.offset(-20);
        make.top.equalTo(self.contentView).with.offset(15);
    }];

    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.progressView.mas_right).with.offset(15);
        make.top.equalTo(self.dramaTitleLabel.mas_bottom).with.offset(5);
    }];
}

#pragma mark - getter -

- (UCZProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UCZProgressView alloc] init];
        _progressView.showsText = YES;
        _progressView.translatesAutoresizingMaskIntoConstraints = NO;
        _progressView.indeterminate = YES;
    }
    return _progressView;
}

- (UILabel *)dramaTitleLabel
{
    if (!_dramaTitleLabel) {
        _dramaTitleLabel = [[UILabel alloc] init];
        _dramaTitleLabel.font = [UIFont gd_fontOfSize:14];
        _dramaTitleLabel.lineBreakMode = NSLineBreakByClipping;
        _dramaTitleLabel.clipsToBounds = YES;
        _dramaTitleLabel.numberOfLines = 2;
    }
    return _dramaTitleLabel;
}

- (UILabel *)subtitleLabel
{
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont gd_fontOfSize:12];
        _subtitleLabel.textColor = [UIColor gd_grayColor];
    }
    return _subtitleLabel;
}

@end
