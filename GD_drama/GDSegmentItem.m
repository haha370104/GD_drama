//
//  GDSegmentItem.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/29.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDSegmentItem.h"

@implementation GDSegmentItem

- (instancetype)initWithTitle: (NSString *)title image: (UIImage *)image
{
    if ((self = [super init])) {
        self.segementTitle = title;
        self.segementImage = image;
    }
    return self;
}

@end
