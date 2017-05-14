//
//  GDRegisterController.m
//  GD_drama
//
//  Created by 罗向宇 on 2017/5/14.
//  Copyright © 2017年 罗向宇. All rights reserved.
//

#import "GDRegisterController.h"
#import "GDLeftTitleRightTextFieldTableViewCell.h"
#import "GDLeftTextFieldRightCustomButtonTableViewCell.h"

#import "UIFont+GDTheme.h"
#import "UIColor+GDTheme.h"
#import "MBProgressHUD+GDProgressHUD.h"
#import "NSObject+GDTypeCheck.h"

#import "GDUserAPI.h"

#import <Masonry/Masonry.h>

@interface GDRegisterController () <UITableViewDelegate, UITableViewDataSource, GDLeftTextFieldRightCustomButtonCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILabel *smsCodeLabel;

@property (nonatomic, strong) NSString *phoneNum;
@property (nonatomic, strong) NSString *smsCode;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, assign) BOOL showPassword;

@property (nonatomic, assign) NSInteger countDown;
@property (nonatomic, strong) NSTimer *countDownTimer;

@end

@implementation GDRegisterController

#pragma mark - init -

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view addSubview:self.tableView];
        [self setupConstraints];
        self.showPassword = NO;
    }
    return self;
}

#pragma mark - lifecycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDLeftTextFieldRightCustomButtonTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GDLeftTextFieldRightCustomButtonTableViewCell class]) forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;

    switch (indexPath.row) {
        case 0: {
            [cell setRightButtonView:nil];
            [cell.leftTextField setKeyboardType:UIKeyboardTypePhonePad];
            cell.leftTextField.placeholder = @"手机号";
        } break;
        case 1: {
            UIView *idCodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 29)];
            idCodeView.layer.masksToBounds = YES;
            idCodeView.layer.cornerRadius = 4.0f;
            idCodeView.layer.borderWidth = 1.0f;
            idCodeView.layer.borderColor = [[UIColor gd_radicalRedColor] CGColor];
            idCodeView.backgroundColor = [UIColor clearColor];

            UILabel *label = [[UILabel alloc] init];
            label.text = @"获取验证码";
            label.font = [UIFont gd_systemFontOfSize:12];
            label.textColor = [UIColor gd_radicalRedColor];

            self.smsCodeLabel = label;
            [idCodeView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.centerY.equalTo(idCodeView);
            }];
            [cell setRightButtonView:idCodeView];
            [cell.leftTextField setKeyboardType:UIKeyboardTypeNumberPad];
            cell.leftTextField.placeholder = @"请输入验证码";
        } break;
        case 2: {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hide_password"]];
            [cell setRightButtonView:imageView];
            [cell.leftTextField setSecureTextEntry:YES];
            self.showPassword = NO;
            cell.leftTextField.placeholder = @"密码";
        } break;
        case 3: {
            [cell setRightButtonView:nil];
            cell.leftTextField.placeholder = @"邮箱";
        } break;
        default:
            return nil;
            break;
    }
    return cell;
}

#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 51;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];

    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.backgroundColor = [UIColor gd_radicalRedColor];
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont gd_systemFontOfSize:16];
    loginButton.layer.cornerRadius = 5;
    loginButton.clipsToBounds = YES;
    [loginButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(footerView).with.offset(15);
        make.right.equalTo(footerView).with.offset(-15);
        make.height.equalTo(@44);
    }];

    return footerView;
}

#pragma mark - GDLeftTextFieldRightCustomButtonCellDelegate -

- (void)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell rightButtonClicked:(id)sender
{
    [self.tableView endEditing:YES];
    switch (cell.indexPath.row) {
        case 1:
            [self sendIdCodeNumber];
            break;
        case 2:
            [self changePasswordStatusForCell:cell];
            break;
        default:
            break;
    }
}

- (void)leftTextFieldRightCustomButtonCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell textFieldDidEndEditing:(UITextField *)textField
{
    switch (cell.indexPath.row) {
        case 0:
            self.phoneNum = textField.text;
            break;
        case 1:
            self.smsCode = textField.text;
            break;
        case 2:
            self.password = textField.text;
            break;
        case 3:
            self.email = textField.text;
            break;
        default:
            break;
    }
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.equalTo(self.view);
    }];
}

- (void)sendIdCodeNumber
{
    if (self.countDownTimer) {
        return;
    }
    if (self.phoneNum.length == 0) {
        [MBProgressHUD showErrorState:@"请输入手机号" inView:nil];
        return;
    }

    MBProgressHUD *progress = [MBProgressHUD showLoadingState:@"发送中..." inView:nil inBackground:YES];

    [GDUserAPI getSMSCode:self.phoneNum complete:^(NSDictionary *response, BOOL success) {
        [progress hide:YES];
        if (success) {
            [MBProgressHUD showSuccessState:@"验证码发送成功" inView:nil];
            self.smsCodeLabel.textColor = [UIColor gd_grayColor];
            _countDown = 60;
            self.smsCodeLabel.text = [NSString stringWithFormat:@"%ld秒后获取验证码", (long)_countDown];
            self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDownTime) userInfo:nil repeats:YES];
        } else {
            [MBProgressHUD showErrorState:[response stringValueForKey:@"error"] inView:nil];
        }
    }];
}

- (void)countDownTime
{
    _countDown--;
    self.smsCodeLabel.text = [NSString stringWithFormat:@"%ld秒后获取验证码", (long)_countDown];
    if (_countDown == 0) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
        self.smsCodeLabel.textColor = [UIColor gd_radicalRedColor];
        self.smsCodeLabel.text = @"获取验证码";
    }
}

- (void)changePasswordStatusForCell:(GDLeftTextFieldRightCustomButtonTableViewCell *)cell
{
    self.showPassword = !self.showPassword;
    if (self.showPassword) {
        [cell.leftTextField setSecureTextEntry:NO];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show_password"]];
        [cell setRightButtonView:imageView];
    } else {
        [cell.leftTextField setSecureTextEntry:YES];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hide_password"]];
        [cell setRightButtonView:imageView];
    }
}

- (void)registerButtonClick:(UIButton *)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

    if (!self.phoneNum.length) {
        [MBProgressHUD showErrorState:@"手机号未填" inView:nil];
        return;
    }

    if (!self.password.length) {
        [MBProgressHUD showErrorState:@"密码未填" inView:nil];
        return;
    }

    if (!self.smsCode.length) {
        [MBProgressHUD showErrorState:@"验证码未填" inView:nil];
        return;
    }

    if (!self.email.length) {
        [MBProgressHUD showErrorState:@"邮箱未填" inView:nil];
        return;
    }
    [GDUserAPI registerWithPhoneNum:self.phoneNum smsCode:self.smsCode password:self.password email:self.email complete:^(NSDictionary *response, BOOL success) {
        if (success) {
            [MBProgressHUD showSuccessState:@"注册成功，请登录" inView:nil];
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [MBProgressHUD showErrorState:[response stringValueForKey:@"error"] inView:nil];
        }
    }];
}

#pragma mark - getter && setter -

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.allowsSelection = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor gd_aLittleGrayColor];
        [_tableView registerClass:[GDLeftTextFieldRightCustomButtonTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GDLeftTextFieldRightCustomButtonTableViewCell class])];
    }
    return _tableView;
}

@end
