//
//  GDDramaCellInnerView.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HCSStarRatingView/HCSStarRatingView.h>

@class HCSStarRatingView;

@interface GDDramaCellInnerView : UIView

@property (nonatomic, strong, readonly) UIImageView *dramaImageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *subtitleLabel;
@property (nonatomic, strong, readonly) HCSStarRatingView *starRatingView;

@end
