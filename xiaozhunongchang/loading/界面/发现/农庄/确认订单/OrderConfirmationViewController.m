//
//  OrderConfirmationViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "OrderConfirmationViewController.h"

@interface OrderConfirmationViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation OrderConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"确认订单";
    // Do any additional setup after loading the view from its nib.
    _orderTableView.delegate = self;
    _orderTableView.dataSource = self;
    _orderTableView.tableHeaderView = _header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderConfirmationCell" owner:nil options:nil] lastObject];
    }
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    cell.userInteractionEnabled = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
