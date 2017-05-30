//
//  GDMyFavoriteController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDMyFavoriteController.h"
#import "GDDramaCollectionViewCell.h"
#import "GDDramaInfoController.h"

#import "GDDramaAPI.h"

#import "NSObject+GDTypeCheck.h"
#import "NSObject+GDOperation.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GDMyFavoriteController ()

@property (nonatomic, strong) UICollectionView *dramaCollectionView;

@property (nonatomic, copy) NSArray *dramaList;

@end

@implementation GDMyFavoriteController

#pragma mark - init -

- (instancetype)init
{
    if ((self = [super init])) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;

        [self.view addSubview:self.dramaCollectionView];
        [self setupConstraints];

        [GDDramaAPI getFavouriteList:^(NSDictionary *response, BOOL success) {
            self.dramaList = [response arrayValueForKey:@"result"];
            [self.dramaCollectionView reloadData];
        }];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dramaList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GDDramaCollectionViewCell *cell = [self.dramaCollectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GDDramaCollectionViewCell class]) forIndexPath:indexPath];
    NSDictionary *item = [self.dramaList gd_safeObjectAtIndex:indexPath.item];
    [cell.innerView.dramaImageView sd_setImageWithURL:[NSURL URLWithString:[item stringValueForKey:@"image"]]];
    cell.innerView.titleLabel.text = [item stringValueForKey:@"title"];
    cell.innerView.subtitleLabel.text = [item stringValueForKey:@"subtitle"];
    cell.innerView.starRatingView.value = [item floatValueForKey:@"mark"];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width, 100);
}

#pragma mark - UICollectionViewDelegate -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.item;
    NSString *dramaID = [[self.dramaList gd_safeObjectAtIndex:index] stringValueForKey:@"id"];
    GDDramaInfoController *controller = [[GDDramaInfoController alloc] initWithDramaID:dramaID];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.dramaCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.width.height.equalTo(self.view);
    }];
}

#pragma mark - getter -

- (UICollectionView *)dramaCollectionView
{
    if (!_dramaCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _dramaCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _dramaCollectionView.delegate = self;
        _dramaCollectionView.dataSource = self;
        _dramaCollectionView.backgroundColor = [UIColor whiteColor];
        [_dramaCollectionView registerClass:[GDDramaCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([GDDramaCollectionViewCell class])];
    }
    return _dramaCollectionView;
}

@end
