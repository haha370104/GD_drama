//
//  GDDramaMetaView.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDDramaMetaView : UIView

@property (nonatomic, strong, readonly) UIView *separatorView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, copy) NSArray <NSDictionary *> *metas;

@end
