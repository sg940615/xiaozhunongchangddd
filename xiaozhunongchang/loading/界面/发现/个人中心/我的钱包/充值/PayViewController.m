//
//  PayViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView *backgroundView;


@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"充值";
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view from its nib.
    _PayTableView.delegate = self;
    _PayTableView.dataSource = self;
    _PayTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _PayTableView.tableFooterView = _footerView;
    _PayTableView.tableHeaderView = _headerView;
    _PayTableView.scrollEnabled = NO;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    _backgroundView.backgroundColor = color(0, 0, 0, 0.3);
    [self.appdelegate.window addSubview:_backgroundView];
//    _backgroundView.hidden = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked)];
    [_backgroundView addGestureRecognizer:tap];
    _payView.center = _backgroundView.center;
    [_backgroundView addSubview:_payView];
}

- (void)tapClicked {
    _backgroundView.hidden = YES;
}
- (IBAction)chooseBtn:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = @"100小猪币";
    cell.detailTextLabel.text = @"优惠价:10.00";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _backgroundView.hidden = NO;
}

#pragma mark --- 充值button点击事件
- (IBAction)buttonClicked:(id)sender {
    
}

@end
