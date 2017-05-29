//
//  GDBottomSegmentView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDBottomSegmentView.h"
#import "GDSegmentView.h"
#import <Masonry/Masonry.h>

@interface GDBottomSegmentView ()

@property (nonatomic, copy) NSMutableArray <GDSegmentView *> *segementViews;

@end

@implementation GDBottomSegmentView

#pragma mark - private -

- (void)setupSegementView
{
    self.segementViews = [[NSMutableArray alloc] init];
    [self.segementViews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];

    [self.items enumerateObjectsUsingBlock:^(GDSegmentItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GDSegmentView *view = [[GDSegmentView alloc] init];
        view.topImageView.image = obj.segementImage;
        view.bottomTitleLabel.text = obj.segementTitle;
        [self.segementViews addObject:view];
        [self setupConstraints];
    }];
}

- (void)setupConstraints
{
    GDSegmentView *preView;
    for (GDSegmentView *view in self.segementViews) {

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
        }];
        if ([self.segementViews indexOfObject:view] == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
            }];
        } else if ([self.segementViews lastObject] == view) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right);
                make.width.equalTo(preView);
                make.right.equalTo(self);
            }];
        } else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right);
                make.width.equalTo(preView);
            }];
        }
        preView = view;
    }
}

#pragma mark - setter - 

- (void)setItems:(NSArray *)items
{
    self.items = [items copy];
    [self setupSegementView];
}

@end
