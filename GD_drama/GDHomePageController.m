//
//  GDHomePageController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDHomePageController.h"
#import "GDFakeSearchBarView.h"

#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDHomePageController ()<UIScrollViewDelegate>

@property (nonatomic, strong) GDFakeSearchBarView *fakeSearchBarView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) UICollectionView *dramaCategoryCollectionView;
@property (nonatomic, strong) UIScrollView *bannerScrollView;
@property (nonatomic, strong) UITableView *guessYouLikeTableView;

@end

@implementation GDHomePageController

#pragma mark - init -

- (instancetype)init
{
    if ((self = [super init])) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;

        [self.view addSubview:self.fakeSearchBarView];
        [self.view addSubview:self.contentScrollView];

        [self.view addSubview:self.dramaCategoryCollectionView];
        [self.view addSubview:self.bannerScrollView];
        [self.view addSubview:self.guessYouLikeTableView];

        self.view.backgroundColor = [UIColor gd_almostWhiteColor];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.fakeSearchBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.width.equalTo(self.view);
        make.height.equalTo(@(40));
    }];

    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fakeSearchBarView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - getter -

- (GDFakeSearchBarView *)fakeSearchBarView
{
    if (!_fakeSearchBarView) {
        _fakeSearchBarView = [[GDFakeSearchBarView alloc] init];
        _fakeSearchBarView.placeholderLabel.text = @"搜索影片";
    }
    return _fakeSearchBarView;
}

- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.delegate = self;
        _contentScrollView.backgroundColor = [UIColor blueColor];
    }
    return _contentScrollView;
}

@end
