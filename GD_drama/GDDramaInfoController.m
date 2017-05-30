//
//  GDDramaInfoController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/15.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaInfoController.h"
#import "GDScoreViewController.h"
#import "GDImageScrollView.h"
#import "GDDramaTitleInnerView.h"
#import "GDDramaMetaView.h"
#import "GDPopMenuView.h"
#import "GDDramaListView.h"

#import "GDDramaAPI.h"

#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"
#import "MBProgressHUD+GDProgressHUD.h"

#import <Masonry/Masonry.h>

@interface GDDramaInfoController () <GDPopoverMenuDelegate>

@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) GDImageScrollView *postImageScrollView;
@property (nonatomic, strong) GDDramaTitleInnerView *titleView;
@property (nonatomic, strong) GDDramaMetaView *metaView;
@property (nonatomic, strong) GDDramaListView *downloadListView;
@property (nonatomic, strong) GDDramaListView *remarkListView;

@property (nonatomic, strong) UIView *popoverMenu;

@property (nonatomic, copy) NSString *dramaID;

@end

@implementation GDDramaInfoController

#pragma mark - init -

- (instancetype)initWithDramaID: (NSString *)dramaID
{
    if ((self = [super init])) {
        self.dramaID = dramaID;
        [self.view addSubview:self.contentView];

        [self.contentView addSubview:self.postImageScrollView];
        [self.contentView addSubview:self.titleView];
        [self.contentView addSubview:self.metaView];
        [self.contentView addSubview:self.downloadListView];
        [self.contentView addSubview:self.remarkListView];

        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(moreActionsButtonPressed:)];
        self.navigationItem.rightBarButtonItem = rightButton;

        [self setupConstraints];
        [self setupData];
    }
    return self;
}

#pragma mark - event -

- (void)moreActionsButtonPressed:(id)sender
{
    if (![self isShowingPopoverMenu]) {
        [self showPopoverMenu];
    } else {
        [self dismissPopoverMenu];
    }
}

#pragma mark - GDPopoverMenuDelegate -

- (NSInteger)numberOfLinesOfPopoverMenu:(GDPopMenuView *)menu
{
    return 2;
}

- (NSString *)popoverMenu:(GDPopMenuView *)menu titleAtIndex:(NSInteger)index
{
    if (index == 0) {
        return @"喜欢";
    } else {
        return @"评分";
    }
}

- (UIImage *)popoverMenu:(GDPopMenuView *)menu imageAtIndex:(NSInteger)index
{
    if (index == 0) {
        return [UIImage imageNamed:@"like"];
    } else {
        return [UIImage imageNamed:@"star"];
    }
}

- (void)popoverMenu:(GDPopMenuView *)menu didClickMenuItemAtIndex:(NSInteger)index
{
    [self dismissPopoverMenu];

    if (index == 0) {
        [self likeThisDrama];
    } else {
        [self scoreThisDrama];
    }
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
        make.width.height.equalTo(self.view);
    }];

    [self.postImageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.width.equalTo(self.contentView);
        make.height.equalTo(@(280));
    }];

    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.postImageScrollView.mas_bottom);
        make.height.equalTo(@(90));
        make.left.right.equalTo(self.contentView);
    }];

    [self.metaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom);
        make.left.right.equalTo(self.contentView);
    }];

    [self.downloadListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.metaView.mas_bottom);
        make.left.right.equalTo(self.contentView);
    }];

    [self.remarkListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.downloadListView.mas_bottom);
        make.left.right.bottom.equalTo(self.contentView);
    }];
}

- (void)setupData
{
    [GDDramaAPI getDramaInfo:self.dramaID complete:^(NSDictionary *response, BOOL success) {
        NSArray *result = [response arrayValueForKey:@"result"];

        NSDictionary *imageViewItem = [result gd_safeObjectAtIndex:0];
        self.postImageScrollView.imageList = [imageViewItem arrayValueForKey:@"images"];

        NSDictionary *titleViewItem = [result gd_safeObjectAtIndex:1];
        self.titleView.titleLabel.text = [titleViewItem stringValueForKey:@"title"];
        self.titleView.leftSubtitleLabel.text = [titleViewItem stringValueForKey:@"type"];
        self.titleView.rightSubtitleLabel.text = [titleViewItem stringValueForKey:@"date"];
        self.titleView.ratingView.value = [titleViewItem floatValueForKey:@"mark"];

        NSDictionary *metaViewItem = [result gd_safeObjectAtIndex:2];
        self.metaView.metas = [metaViewItem arrayValueForKey:@"meta"];
        self.metaView.titleLabel.text = [metaViewItem stringValueForKey:@"title"];

        NSDictionary *downloadViewItem = [result gd_safeObjectAtIndex:3];
        self.downloadListView.titleLabel.text = [downloadViewItem stringValueForKey:@"title"];
        self.downloadListView.listItems = [downloadViewItem arrayValueForKey:@"items"];

        NSDictionary *remarkViewItem = [result gd_safeObjectAtIndex:4];
        self.remarkListView.titleLabel.text = [remarkViewItem stringValueForKey:@"title"];
        self.remarkListView.listItems = [remarkViewItem arrayValueForKey:@"items"];
    }];
}

- (BOOL)isShowingPopoverMenu
{
    return self.popoverMenu.superview != nil;
}

- (void)showPopoverMenu
{
    CGRect frame = self.view.bounds;
    self.popoverMenu.frame = CGRectMake(frame.origin.x, frame.origin.y + 64, frame.size.width, frame.size.height);
    [self.view addSubview:self.popoverMenu];
}

- (void)dismissPopoverMenu
{
    [self.popoverMenu removeFromSuperview];
}

- (void)likeThisDrama
{
    [MBProgressHUD showSuccessState:@"已加入到我的喜欢" inView:nil];
}

- (void)scoreThisDrama
{
    GDScoreViewController *controller = [[GDScoreViewController alloc] initWithDramaID: self.dramaID];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - getter -

- (UIScrollView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] init];
    }
    return _contentView;
}

- (GDImageScrollView *)postImageScrollView
{
    if (!_postImageScrollView) {
        _postImageScrollView = [[GDImageScrollView alloc] init];
    }
    return _postImageScrollView;
}

- (GDDramaTitleInnerView *)titleView
{
    if (!_titleView) {
        _titleView = [[GDDramaTitleInnerView alloc] init];
    }
    return _titleView;
}

- (GDDramaMetaView *)metaView
{
    if (!_metaView) {
        _metaView = [[GDDramaMetaView alloc] init];
    }
    return _metaView;
}

- (GDDramaListView *)downloadListView
{
    if (!_downloadListView) {
        _downloadListView = [[GDDramaListView alloc] init];
    }
    return _downloadListView;
}

- (GDDramaListView *)remarkListView
{
    if (!_remarkListView) {
        _remarkListView = [[GDDramaListView alloc] init];
    }
    return _remarkListView;
}

- (UIView *)popoverMenu
{
    if (!_popoverMenu) {
        _popoverMenu = [[UIView alloc] initWithFrame:self.view.bounds];

        UIView *dismissView = [[UIView alloc] initWithFrame:_popoverMenu.bounds];
        dismissView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_popoverMenu addSubview:dismissView];

        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopoverMenu)];
        [dismissView addGestureRecognizer:dismissTap];

        GDPopMenuView *realMenu = [[GDPopMenuView alloc] init];
        realMenu.popoverMenuDelegate = self;
        [_popoverMenu addSubview:realMenu];
        [realMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_popoverMenu);
            make.trailing.equalTo(_popoverMenu).with.offset(-10);
        }];
    }

    return _popoverMenu;
}

@end
