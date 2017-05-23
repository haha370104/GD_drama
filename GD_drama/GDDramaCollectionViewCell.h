//
//  GDDramaCollectionViewCell.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/21.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDramaCellInnerView.h"

@interface GDDramaCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) GDDramaCellInnerView *innerView;

@end
