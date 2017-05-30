//
//  GDDramaTitleInnerView.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HCSStarRatingView/HCSStarRatingView.h>

@interface GDDramaTitleInnerView : UIView

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *leftSubtitleLabel;
@property (nonatomic, strong, readonly) UILabel *rightSubtitleLabel;

@property (nonatomic, strong, readonly) HCSStarRatingView *ratingView;

@end
