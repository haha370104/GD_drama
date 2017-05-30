//
//  GDPopMenuView.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/30.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDPopMenuView;
@protocol GDPopoverMenuDelegate <NSObject>

@optional
- (void)popoverMenu:(GDPopMenuView *)menu didClickMenuItemAtIndex:(NSInteger)index;

@required
- (UIImage *)popoverMenu:(GDPopMenuView *)menu imageAtIndex:(NSInteger)index;
- (NSString *)popoverMenu:(GDPopMenuView *)menu titleAtIndex:(NSInteger)index;
- (NSInteger)numberOfLinesOfPopoverMenu:(GDPopMenuView *)menu;

@end

@interface GDPopMenuView : UIView

@property (nonatomic, weak) id<GDPopoverMenuDelegate> popoverMenuDelegate;

@end
