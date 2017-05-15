//
//  GDSearchViewController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDSearchViewController.h"

@implementation GDSearchViewController

#pragma mark - init -

- (instancetype)init
{
    if ((self = [super init])) {
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonDidTapped)];
        self.navigationItem.leftBarButtonItem = button;
    }
    return self;
}

#pragma mark - event -

- (void)cancelButtonDidTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
