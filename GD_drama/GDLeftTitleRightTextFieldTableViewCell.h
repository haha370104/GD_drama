//
//  GDLeftTitleRightTextFieldTableViewCell.h
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/22.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDLeftTitleRightTextFieldTableViewCell;
@protocol GDLeftTitleRightTextFieldCellDelegate <NSObject>

- (void)leftTitleRightTextFieldChanged:(GDLeftTitleRightTextFieldTableViewCell *)cell stringInCell:(NSString *)stringInCell;

@end

@interface GDLeftTitleRightTextFieldTableViewCellInnerView : UIView

@property (nonatomic, strong, readonly) UILabel *leftLabel;
@property (nonatomic, strong, readonly) UITextField *rightTextField;

@end

@interface GDLeftTitleRightTextFieldTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) GDLeftTitleRightTextFieldTableViewCellInnerView *innerView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<GDLeftTitleRightTextFieldCellDelegate> delegate;

@end
