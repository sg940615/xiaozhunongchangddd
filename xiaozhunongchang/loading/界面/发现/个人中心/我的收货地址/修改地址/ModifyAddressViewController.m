//
//  ModifyAddressViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ModifyAddressViewController.h"

@interface ModifyAddressViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ModifyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"收货地址";
    // Do any additional setup after loading the view from its nib.
    _ModifyAddressTableView.delegate = self;
    _ModifyAddressTableView.dataSource = self;
    _ModifyAddressTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _ModifyAddressTableView.scrollEnabled = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ModifyAddressCell" owner:nil options:nil] lastObject];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    [self addFenGeXian:cell andRect:CGRectMake(0, 43, ScreenWidth, 1)];
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
