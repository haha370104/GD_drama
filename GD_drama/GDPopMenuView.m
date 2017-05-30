//
//  GDPopMenuView.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/30.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDPopMenuView.h"
#import "UIColor+GDTheme.h"

#import <Masonry/Masonry.h>

@interface GDPopMenuView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *menuTable;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIImageView *backgroundImage;

@end

@implementation GDPopMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundImage];
        [self addSubview:self.menuTable];
        [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self.menuTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.top.equalTo(self).with.offset(7);
            make.width.mas_equalTo(145);
        }];
    }
    return self;
}

#pragma mark - table view delegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.popoverMenuDelegate numberOfLinesOfPopoverMenu:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.popoverMenuDelegate popoverMenu:self titleAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [self.popoverMenuDelegate popoverMenu:self imageAtIndex:indexPath.row];
    if (indexPath.row < [tableView numberOfRowsInSection:indexPath.section] - 1) {
        UIView *bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor = [UIColor gd_whiteColor];
        [cell addSubview:bottomLine];
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(cell).with.offset(1);
            make.trailing.equalTo(cell).with.offset(-1);
            make.bottom.equalTo(cell);
            make.height.mas_equalTo(0.5);
        }];
    }
    cell.backgroundColor = [UIColor gd_darkGrayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.popoverMenuDelegate respondsToSelector:@selector(popoverMenu:didClickMenuItemAtIndex:)]) {
        [self.popoverMenuDelegate popoverMenu:self didClickMenuItemAtIndex:indexPath.row];
    }
}

#pragma mark - getter & setter -

- (UITableView *)menuTable
{
    if (_menuTable == nil) {
        _menuTable = [[UITableView alloc] init];
        _menuTable.delegate = self;
        _menuTable.dataSource = self;
        _menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTable.scrollEnabled = NO;
        _menuTable.backgroundColor = [UIColor clearColor];
    }
    return _menuTable;
}

- (UIImageView *)backgroundImage
{
    if (_backgroundImage == nil) {
        UIImage *backgroundImage = [UIImage imageNamed:@"menu_bubble"];
        UIImage *resizableImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 5, 5, 15)];
        _backgroundImage = [[UIImageView alloc] initWithImage:resizableImage];
        _backgroundImage.contentMode = UIViewContentModeScaleToFill;
    }
    return _backgroundImage;
}

- (void)setPopoverMenuDelegate:(id<GDPopoverMenuDelegate>)popoverMenuDelegate
{
    _popoverMenuDelegate = popoverMenuDelegate;
    [self.menuTable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(45 * [self.popoverMenuDelegate numberOfLinesOfPopoverMenu:self]);
    }];
}

@end
