//
//  GDImageScrollView.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDImageScrollView : UIView

@property (nonatomic, strong, readonly) UIScrollView *imageScrollView;
@property (nonatomic, copy) NSArray <NSDictionary *> *imageList;

@end
