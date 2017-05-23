//
//  GDDownloadController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDDownloadController.h"
#import "GDDownloadTableViewCell.h"

#import "GDDramaAPI.h"
#import "NSObject+GDOperation.h"
#import "NSObject+GDTypeCheck.h"

#import <Masonry/Masonry.h>

@interface GDDownloadController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *downloadTableView;

@property (nonatomic, copy) NSArray *downloadList;

@end

@implementation GDDownloadController

#pragma mark - init -

- (instancetype)init
{
    if ((self = [super init])) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;

        [self.view addSubview:self.downloadTableView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - lifecycle -

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [GDDramaAPI getDownloadList:^(NSDictionary *response, BOOL success) {
        self.downloadList = [response arrayValueForKey:@"result"];
    }];
}

#pragma mark - UITableViewDelegate -

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.downloadList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDDownloadTableViewCell *cell = [self.downloadTableView dequeueReusableCellWithIdentifier:NSStringFromClass([GDDownloadTableViewCell class])];
    NSDictionary *downloadItem = [self.downloadList gd_safeObjectAtIndex:indexPath.row];
    cell.progressView.progress = [downloadItem floatValueForKey:@"progress"];
    cell.dramaTitleLabel.text = [downloadItem stringValueForKey:@"title"];
    cell.subtitleLabel.text = [downloadItem stringValueForKey:@"subtitle"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.downloadTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}

#pragma mark - getter -

- (UITableView *)downloadTableView
{
    if (!_downloadTableView) {
        _downloadTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _downloadTableView.delegate = self;
        _downloadTableView.dataSource = self;
        _downloadTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _downloadTableView.tableFooterView = [[UIView alloc] init];
        _downloadTableView.allowsSelection = NO;

        [_downloadTableView registerClass:[GDDownloadTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GDDownloadTableViewCell class])];
    }
    return _downloadTableView;
}

#pragma mark - setter -

- (void)setDownloadList:(NSArray *)downloadList
{
    _downloadList = [downloadList copy];
    [self.downloadTableView reloadData];
}

@end
