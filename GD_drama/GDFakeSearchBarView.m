//
//  GDFakeSearchBar.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDFakeSearchBarView.h"
#import <Masonry/Masonry.h>
#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"

@interface GDFakeSearchBarView ()

@property (nonatomic, strong) UIView *searchBarBackgroundView;
@property (nonatomic, strong, readwrite) UIImageView *searchIcon;
@property (nonatomic, strong, readwrite) UITextField *searchInput;

@end


@implementation GDFakeSearchBarView

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.searchBarBackgroundView];
        [self.searchBarBackgroundView addSubview:self.searchIcon];
        [self.searchBarBackgroundView addSubview:self.searchInput];
        [self setupViewsConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupViewsConstraints
{
    [self.searchBarBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.height.equalTo(self).multipliedBy(0.7f);
        make.width.equalTo(self).multipliedBy(0.95f);
    }];

    [self.searchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchBarBackgroundView);
        make.left.equalTo(self.searchBarBackgroundView).offset(20);
        make.width.equalTo(@15);
    }];

    [self.searchInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchBarBackgroundView);
        make.left.equalTo(self.searchIcon.mas_right).with.offset(6.0f);
        make.right.equalTo(self.searchBarBackgroundView).offset(-20);
    }];
}

#pragma mark - getter & setter -

- (UIView *)searchBarBackgroundView
{
    if (!_searchBarBackgroundView) {
        _searchBarBackgroundView = [[UIView alloc] init];
        _searchBarBackgroundView.backgroundColor = [UIColor gd_almostWhiteColor];
        self.searchBarBackgroundView.layer.cornerRadius = 3.0f;
    }
    return _searchBarBackgroundView;
}

- (UIImageView *)searchIcon
{
    if (!_searchIcon) {
        _searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeNavigationSearch"]];
        _searchIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _searchIcon;
}

- (UITextField *)searchInput
{
    if (!_searchInput) {
        _searchInput = [[UITextField alloc] init];
        _searchInput.placeholder = @"搜索影片";
        _searchInput.returnKeyType = UIReturnKeySearch;

        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        CGFloat kFontSize = (screenSize.width < 375.0f) ? 11.0f : 13.0f;
        _searchInput.font = [UIFont gd_systemFontOfSize:kFontSize];
    }
    return _searchInput;
}

@end
