//
//  GDDramaCollectionViewCell.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDramaCollectionViewCell.h"

#import <Masonry/Masonry.h>

@interface GDDramaCollectionViewCell ()

@property (nonatomic, strong) GDDramaCellInnerView *innerView;

@end

@implementation GDDramaCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self.contentView addSubview:self.innerView];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [self.innerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.centerX.centerY.equalTo(self.contentView);
    }];
}

- (GDDramaCellInnerView *)innerView
{
    if (!_innerView) {
        _innerView = [[GDDramaCellInnerView alloc] init];
    }
    return _innerView;
}

@end
