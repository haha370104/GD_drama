//
//  GDHomePageController.h
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDHomePageController : UIViewController

@property (nonatomic, copy) NSArray<NSDictionary *> *categoryList;
@property (nonatomic, copy) NSArray<NSDictionary *> *bannerImageList;
@property (nonatomic, copy) NSArray<NSDictionary *> *guessYouLikeDramaList;

@end
