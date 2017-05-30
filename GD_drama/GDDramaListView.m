//
//  GDDramaListView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaListView.h"
#import "GDDramaInfoCellInnerView.h"

#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"
#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIButton+WebCache.h>

@interface GDDramaListView ()

@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *showMoreButton;

@end

@implementation GDDramaListView

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor gd_almostWhiteColor];
    }
    return self;
}

#pragma mark - private -

- (void)setupViews
{
    NSMutableArray <GDDramaInfoCellInnerView *> *cells = [NSMutableArray new];
    [self addSubview:self.separatorView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.showMoreButton];

    [self.listItems enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GDDramaInfoCellInnerView *cell = [[GDDramaInfoCellInnerView alloc] init];
        cell.titleLabel.text = [obj stringValueForKey:@"title"];
        cell.contentLabel.text = [obj stringValueForKey:@"content"];
        [cell.rightImage sd_setImageWithURL:[NSURL URLWithString:[obj stringValueForKey:@"image"]] forState:UIControlStateNormal];
        [self addSubview:cell];
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.borderColor = [[UIColor gd_aLittleGrayColor] CGColor];
        cell.layer.borderWidth = 0.5;
        [cells addObject:cell];
    }];

    [self setupConstraintsWithCells:cells];
}

- (void)setupConstraintsWithCells: (NSArray <GDDramaInfoCellInnerView *> *)cells
{
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(15));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separatorView.mas_bottom).with.offset(10);
        make.right.equalTo(self);
        make.left.equalTo(self).with.offset(15);
    }];

    [self.showMoreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self);
        make.height.equalTo(@(30));
    }];

    GDDramaInfoCellInnerView *preCell;
    for (GDDramaInfoCellInnerView *cell in cells) {
        if ([cells indexOfObject:cell] == 0) {
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self);
                make.height.equalTo(@(60));
                make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
            }];
        } else if ([cells lastObject] == cell) {
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self);
                make.height.equalTo(@(60));
                make.top.equalTo(preCell.mas_bottom);
                make.bottom.equalTo(self.showMoreButton.mas_top);
            }];
        } else {
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self);
                make.height.equalTo(@(60));
                make.top.equalTo(preCell.mas_bottom);
            }];
        }
        preCell = cell;
    }
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

- (UIButton *)showMoreButton
{
    if (!_showMoreButton) {
        _showMoreButton = [[UIButton alloc] init];
        [_showMoreButton setTitle:@"点击显示更多" forState:UIControlStateNormal];
        [_showMoreButton setTitleColor:[UIColor gd_blackColor] forState:UIControlStateNormal];
        _showMoreButton.titleLabel.font = [UIFont gd_fontOfSize:13];
        _showMoreButton.titleLabel.textColor = [UIColor gd_blackColor];
    }
    return _showMoreButton;
}

- (void)setListItems:(NSArray<NSDictionary *> *)listItems
{
    _listItems = [listItems copy];
    [self setupViews];
}

@end
