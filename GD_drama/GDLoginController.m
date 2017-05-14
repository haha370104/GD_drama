//
//  GDLoginController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDLoginController.h"
#import "GDLeftTitleRightTextFieldTableViewCell.h"
#import "GDRegisterController.h"

#import "GDUserAPI.h"

#import "UIColor+GDTheme.h"
#import "UIFont+GDTheme.h"
#import "MBProgressHUD+GDProgressHUD.h"

#import <Masonry/Masonry.h>

@interface GDLoginController ()<UITableViewDelegate, UITableViewDataSource, GDLeftTitleRightTextFieldCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSString *phoneNum;
@property (nonatomic, strong) NSString *password;

@end

@implementation GDLoginController

- (instancetype)init
{
    if (self = [super init]) {
        [self.view addSubview:self.tableView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
}

- (void)setupNavigationBar
{
    self.navigationItem.title = @"登录";

    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerAction:)];
    [registerItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor gd_blueColor] } forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = registerItem;

    if (self.presentingViewController) {
        UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissButtonPressed:)];
        [dismissItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor gd_blueColor] } forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = dismissItem;
    }
}

#pragma mark - action -

- (void)dismissButtonPressed:(UIButton *) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)registerAction:(UIButton *) sender
{
    [self.navigationController pushViewController:[[GDRegisterController alloc] init] animated:YES];
}

- (void)loginButtonClick:(UIButton *)sender
{
    if (!self.phoneNum.length || !self.password.length) {
        [MBProgressHUD showErrorState:@"请填入手机号和密码" inView:nil];
        return;
    }

    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

    [GDUserAPI loginWithphoneNum:self.phoneNum password:self.password complete:^(NSDictionary *response) {
        [MBProgressHUD showSuccessState:@"登陆成功" inView:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

#pragma mark - DPLeftTitleRightTextFieldCellDelegate -

- (void)leftTitleRightTextFieldChanged:(GDLeftTitleRightTextFieldTableViewCell *)cell stringInCell:(NSString *)stringInCell
{
    if (cell.indexPath.row == 0) {
        self.phoneNum = stringInCell;
    } else {
        self.password = stringInCell;
    }
}

#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];

    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.backgroundColor = [UIColor gd_radicalRedColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont gd_systemFontOfSize:16];
    loginButton.layer.cornerRadius = 5;
    loginButton.clipsToBounds = YES;
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(footerView).with.offset(15);
        make.right.equalTo(footerView).with.offset(-15);
        make.height.equalTo(@44);
    }];

    return footerView;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDLeftTitleRightTextFieldTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GDLeftTitleRightTextFieldTableViewCell class])];
    cell.innerView.leftLabel.textColor = [UIColor grayColor];
    if (indexPath.row == 0) {
        cell.innerView.leftLabel.text = @"手机号";
        cell.innerView.rightTextField.placeholder = @"请输入用户手机号";
        cell.innerView.rightTextField.keyboardType = UIKeyboardTypePhonePad;
    } else {
        cell.innerView.leftLabel.text = @"密码";
        cell.innerView.rightTextField.placeholder = @"请输入密码";
        cell.innerView.rightTextField.secureTextEntry = YES;
    }
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}

#pragma mark - getter && setter -

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [_tableView registerClass:[GDLeftTitleRightTextFieldTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GDLeftTitleRightTextFieldTableViewCell class])];
    }
    return _tableView;
}

@end
