//
//  GDDramaInfoController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/15.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaInfoController.h"
#import "GDImageScrollView.h"

@interface GDDramaInfoController ()

@property (nonatomic, strong) UICollectionView *contentView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, copy) NSString *dramaID;

@end

@implementation GDDramaInfoController

#pragma mark - init -

- (instancetype)initWithDramaID: (NSString *)dramaID
{
    if ((self = [super init])) {
        self.dramaID = dramaID;
    }
    return self;
}

#pragma mark - private -

@end
