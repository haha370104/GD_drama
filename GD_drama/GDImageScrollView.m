//
//  GDImageScrollView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDImageScrollView.h"

#import "UIColor+GDTheme.h"
#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface GDImageScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *imageScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation GDImageScrollView

#pragma mark - init -

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self addSubview:self.imageScrollView];
        [self addSubview:self.pageControl];
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

#pragma mark - event -

- (void)scrollPage:(id)sender
{
    CGRect frame = self.imageScrollView.bounds;
    frame.origin.x = self.pageControl.currentPage * frame.size.width;
    [self.imageScrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.imageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];

    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.imageScrollView);
        make.height.equalTo(@20.0f);
    }];
}

- (void)setupBannerScrollView
{
    NSMutableArray <UIImageView *> *imageViewList = [NSMutableArray new];
    [self.imageList enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:obj]];
        [imageViewList addObject:imageView];

        [self.imageScrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.centerY.width.equalTo(self.imageScrollView);
        }];
    }];

    for (UIImageView *imageView in imageViewList) {
        if ([imageViewList indexOfObject:imageView] == 0) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.imageScrollView.mas_left);
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
        make.right.equalTo(self.imageScrollView.mas_right);
    }];

    self.pageControl.numberOfPages = self.imageList.count;
}

#pragma mark - getter -

- (UIScrollView *)imageScrollView
{
    if (!_imageScrollView) {
        _imageScrollView = [[UIScrollView alloc] init];
        _imageScrollView.delegate = self;
        _imageScrollView.backgroundColor = [UIColor gd_lightGrayColor];
        _imageScrollView.pagingEnabled = YES;
        _imageScrollView.showsVerticalScrollIndicator = NO;
        _imageScrollView.showsHorizontalScrollIndicator = NO;
        _imageScrollView.alwaysBounceHorizontal = YES;
        _imageScrollView.clipsToBounds = YES;
    }
    return _imageScrollView;
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

- (void)setImageList:(NSArray<NSString *> *)imageList
{
    _imageList = [imageList copy];
    [self setupBannerScrollView];
}

@end
