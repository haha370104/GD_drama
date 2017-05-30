//
//  GDDramaMetaView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaMetaView.h"

#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"
#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"

#import <Masonry/Masonry.h>

@interface GDDramaMetaView ()

@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation GDDramaMetaView

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor gd_almostWhiteColor];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraintsWithLabels: (NSArray <UILabel *> *)labels
{
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(15));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separatorView.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(15);
    }];

    UILabel *preLabel;
    for (UILabel *label in labels) {
        if ([labels indexOfObject:label] == 0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(30);
                make.left.equalTo(self).with.offset(60);
            }];
        } else if ([labels lastObject] == label) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preLabel.mas_bottom).with.offset(10);
                make.left.equalTo(self).with.offset(60);
                make.bottom.equalTo(self).with.offset(-10);
            }];
        } else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(preLabel.mas_bottom).with.offset(10);
                make.left.equalTo(self).with.offset(60);
            }];
        }
        preLabel = label;
    }
}


- (void)setupViews
{
    [self addSubview:self.separatorView];
    [self addSubview:self.titleLabel];

    NSMutableArray <UILabel *> *metaLabels = [[NSMutableArray alloc] init];
    [self.metas enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont gd_fontOfSize:13];
        [self addSubview:label];
        label.text = [NSString stringWithFormat:@"%@:     %@", [obj stringValueForKey:@"charater"], [obj stringValueForKey:@"actor"]];
        [metaLabels addObject:label];
    }];

    [self setupConstraintsWithLabels:metaLabels];
}

#pragma mark - getter && setter -

- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = [UIColor gd_aLittleGrayColor];
    }
    return _separatorView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont gd_fontOfSize:13];
    }
    return _titleLabel;
}

- (void)setMetas:(NSArray<NSDictionary *> *)metas
{
    _metas = [metas copy];
    [self setupViews];
}

@end
