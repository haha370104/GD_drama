//
//  GDDownloadTableViewCell.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UCZProgressView/UCZProgressView.h>

@interface GDDownloadTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) UILabel *dramaTitleLabel;
@property (nonatomic, strong, readonly) UILabel *subtitleLabel;
@property (nonatomic, strong, readonly) UCZProgressView *progressView;

@end
