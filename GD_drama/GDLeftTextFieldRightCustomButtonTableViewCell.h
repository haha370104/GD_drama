//
//  GDLeftTextFieldRightCustomButtonTableViewCell.h
//  DeliveryProject
//
//  Created by 罗向宇 on 2016/10/23.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDLeftTextFieldRightCustomButtonTableViewCell;
@protocol GDLeftTextFieldRightCustomButtonCellDelegate <NSObject>

@optional
- (void)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell rightButtonClicked:(id)sender;
- (BOOL)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell textFieldShouldBeginEditing:(UITextField *)textField;
- (void)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell textFieldDidBeginEditing:(UITextField *)textField;
- (void)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell textFieldDidEndEditing:(UITextField *)textField;
- (BOOL)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell textFieldShouldReturn:(UITextField *)textField;

@end

@interface GDLeftTextFieldRightCustomButtonTableViewCell : UITableViewCell

@property (nonatomic, weak) id<GDLeftTextFieldRightCustomButtonCellDelegate> delegate;

@property (nonatomic, strong, readonly) UITextField *leftTextField;
@property (nonatomic, strong, readonly) UIView *rightView;
@property (nonatomic, strong) NSIndexPath *indexPath;

// 需要指定传入的buttonView的frame
- (void)setRightButtonView:(UIView *)buttonView;

@end
