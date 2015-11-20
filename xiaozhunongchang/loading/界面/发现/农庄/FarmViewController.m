//
//  FarmViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FarmViewController.h"
#import "MenuListViewController.h"
#import "ShoppingCartViewController.h"

@interface FarmViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation FarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"农庄";
    [self setNavRightBtnWithString:@"登陆"];
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view from its nib.
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.tableHeaderView = _header;
    _menuTableView.showsVerticalScrollIndicator = NO;
    
    UIButton *shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopBtn.frame = CGRectMake(ScreenWidth - 80, ScreenHeight - 140, 45, 45);
    [shopBtn setImage:[UIImage imageNamed:@"民间特产详情_07"] forState:UIControlStateNormal];
    [shopBtn addTarget:self action:@selector(shopBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopBtn];
}

- (void)shopBtnClicked {
    ShoppingCartViewController *shop = [[ShoppingCartViewController alloc] init];
    [self.navigationController pushViewController:shop animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FarmTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 116;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuListViewController *menuList = [[MenuListViewController alloc] init];
    [self.navigationController pushViewController:menuList animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
