//
//  GDHomePageController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDHomePageController.h"
#import "GDSearchViewController.h"
#import "GDFakeSearchBarView.h"
#import "GDImageAndTitleCollectionViewCell.h"
#import "GDDramaCellInnerView.h"

#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"
#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"
#import "UIWindow+MainWindow.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
#import <HCSStarRatingView/HCSStarRatingView.h>

@interface GDHomePageController ()<UIScrollViewDelegate, UITextFieldDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) GDFakeSearchBarView *fakeSearchBarView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) UICollectionView *dramaCategoryCollectionView;

@property (nonatomic, strong) UIScrollView *bannerScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UILabel *guessYouLikeLabel;

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

        [self.contentScrollView addSubview:self.dramaCategoryCollectionView];
        [self.contentScrollView addSubview:self.bannerScrollView];
        [self.contentScrollView addSubview:self.pageControl];
        [self.contentScrollView addSubview:self.guessYouLikeLabel];

        self.view.backgroundColor = [UIColor gd_almostWhiteColor];

        [self setupConstraints];
    }
    return self;
}

#pragma mark - UIScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    self.pageControl.currentPage = currentPage;
}

#pragma mark - UITextFieldDelegate -

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.fakeSearchBarView.searchInput) {
        [textField resignFirstResponder];
        NSLog(@"%@", textField.text);
    }
    return YES;
}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.categoryList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GDImageAndTitleCollectionViewCell *cell = [self.dramaCategoryCollectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GDImageAndTitleCollectionViewCell class]) forIndexPath:indexPath];

    NSDictionary *category = [self.categoryList gd_safeObjectAtIndex:indexPath.item];
    cell.downLabel.text = [category stringValueForKey:@"title"];
    [cell.upImageView sd_setImageWithURL:[NSURL URLWithString:[category stringValueForKey:@"image"]]];

    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width / 4, collectionView.frame.size.height / 2);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.guessYouLikeDramaList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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

    [self.dramaCategoryCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentScrollView);
        make.width.equalTo(self.contentScrollView).multipliedBy(0.95f);
        make.top.equalTo(self.contentScrollView).with.offset(10);
        make.height.equalTo(self.contentScrollView).multipliedBy(0.3f);
    }];

    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentScrollView);
        make.width.equalTo(self.contentScrollView).multipliedBy(0.95f);
        make.top.equalTo(self.dramaCategoryCollectionView.mas_bottom).with.offset(20);
        make.height.equalTo(self.contentScrollView).multipliedBy(0.2f);
    }];

    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.bannerScrollView);
        make.height.equalTo(@20.0f);
    }];

    [self.guessYouLikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentScrollView);
        make.top.equalTo(self.bannerScrollView.mas_bottom).with.offset(20);
    }];
    
}

- (void)setupBannerScrollView
{
    NSMutableArray <UIImageView *> *imageViewList = [NSMutableArray new];
    [self.bannerImageList enumerateObjectsUsingBlock:^(NSDictionary *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[obj stringValueForKey:@"image"]]];
        [imageViewList addObject:imageView];

        [self.bannerScrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.centerY.width.equalTo(self.bannerScrollView);
        }];
    }];

    for (UIImageView *imageView in imageViewList) {
        if ([imageViewList indexOfObject:imageView] == 0) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.bannerScrollView.mas_left);
            }];
        } else {
            NSInteger index = [imageViewList indexOfObject:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                UIImageView *preImageView = [imageViewList gd_safeObjectAtIndex:index - 1];
                make.left.equalTo(preImageView.mas_right);
            }];
        }
    }

    UIImageView *imageView = [imageViewList lastObject];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bannerScrollView.mas_right);
    }];

    self.pageControl.numberOfPages = self.bannerImageList.count;
}

- (void)setupGuessYouLikeDramaListView
{
    NSMutableArray <GDDramaCellInnerView *> *guessYouLikeList = [[NSMutableArray alloc] init];
    [self.guessYouLikeDramaList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GDDramaCellInnerView *cell = [[GDDramaCellInnerView alloc] init];
        [cell.dramaImageView sd_setImageWithURL:[NSURL URLWithString:[obj stringValueForKey:@"image"]]];
        cell.titleLabel.text = [obj stringValueForKey:@"title"];
        cell.subtitleLabel.text = [obj stringValueForKey:@"subtitle"];
        cell.starRatingView.value = [obj floatValueForKey:@"mark"];

        [self.contentScrollView addSubview:cell];
        [guessYouLikeList addObject:cell];
        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentScrollView);
            make.height.equalTo(@(100));
        }];
    }];

    for (GDDramaCellInnerView *cell in guessYouLikeList) {
        if ([guessYouLikeList indexOfObject:cell] == 0) {
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.guessYouLikeLabel.mas_bottom).with.offset(10);
            }];
        } else {
            NSInteger index = [guessYouLikeList indexOfObject:cell];
            [cell mas_makeConstraints:^(MASConstraintMaker *make) {
                GDDramaCellInnerView *preCell = [guessYouLikeList gd_safeObjectAtIndex:index - 1];
                make.top.equalTo(preCell.mas_bottom);
            }];
        }
    }

    GDDramaCellInnerView *cell = [guessYouLikeList lastObject];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentScrollView);
    }];
}

#pragma mark - event -

- (void)scrollPage:(id)sender
{
    CGRect frame = self.bannerScrollView.bounds;
    frame.origin.x = self.pageControl.currentPage * frame.size.width;
    [self.bannerScrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark - getter -

- (GDFakeSearchBarView *)fakeSearchBarView
{
    if (!_fakeSearchBarView) {
        _fakeSearchBarView = [[GDFakeSearchBarView alloc] init];
        _fakeSearchBarView.searchInput.delegate = self;
    }
    return _fakeSearchBarView;
}

- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.delegate = self;
    }
    return _contentScrollView;
}

- (UICollectionView *)dramaCategoryCollectionView
{
    if (!_dramaCategoryCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _dramaCategoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];

        _dramaCategoryCollectionView.dataSource = self;
        _dramaCategoryCollectionView.delegate = self;
        _dramaCategoryCollectionView.backgroundColor = [UIColor whiteColor];

        [_dramaCategoryCollectionView registerClass:[GDImageAndTitleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([GDImageAndTitleCollectionViewCell class])];
    }
    return _dramaCategoryCollectionView;
}

- (UIScrollView *)bannerScrollView
{
    if (!_bannerScrollView) {
        _bannerScrollView = [[UIScrollView alloc] init];
        _bannerScrollView.delegate = self;
        _bannerScrollView.backgroundColor = [UIColor gd_lightGrayColor];
        _bannerScrollView.pagingEnabled = YES;
        _bannerScrollView.showsVerticalScrollIndicator = NO;
        _bannerScrollView.showsHorizontalScrollIndicator = NO;
        _bannerScrollView.alwaysBounceHorizontal = YES;
    }
    return _bannerScrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor gd_lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor gd_radicalRedColor];
        [_pageControl addTarget:self action:@selector(scrollPage:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (UILabel *)guessYouLikeLabel
{
    if (!_guessYouLikeLabel) {
        _guessYouLikeLabel = [[UILabel alloc] init];
        _guessYouLikeLabel.text = @"猜你喜欢";
        _guessYouLikeLabel.font = [UIFont gd_fontOfSize:13];
    }
    return _guessYouLikeLabel;
}

#pragma mark - setter -

- (void)setCategoryList:(NSArray *)categoryList
{
    _categoryList = [categoryList copy];
    [self.dramaCategoryCollectionView reloadData];
}

- (void)setBannerImageList:(NSArray *)bannerImageList
{
    _bannerImageList = [bannerImageList copy];
    [self setupBannerScrollView];
}

- (void)setGuessYouLikeDramaList:(NSArray<NSDictionary *> *)guessYouLikeDramaList
{
    _guessYouLikeDramaList = [guessYouLikeDramaList copy];
    [self setupGuessYouLikeDramaListView];
}

@end
