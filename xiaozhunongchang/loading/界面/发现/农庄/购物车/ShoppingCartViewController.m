//
//  ShoppingCartViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.title = @"购物车";
    [self setNavLeftBtnWithImg];
    // Do any additional setup after loading the view from its nib.
    _shoppingcartTableView.delegate = self;
    _shoppingcartTableView.dataSource = self;
    _shoppingcartTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShoppingCartCell" owner:nil options:nil] lastObject];
    }
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}



@end
