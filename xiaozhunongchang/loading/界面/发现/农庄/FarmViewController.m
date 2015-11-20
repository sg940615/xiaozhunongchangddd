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

@property (nonatomic, strong) NSMutableArray *CityBtnArray;

@end

@implementation FarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _CityBtnArray = [NSMutableArray array];
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
    
    [_CityBtnArray addObject:_zunyiBtn];
    [_CityBtnArray addObject:_xishuiBtn];
    [_CityBtnArray addObject:_yibinBtn];
    _zunyiBtn.backgroundColor = ZCnongzhuang;
}

#pragma mark --- 菜单和套餐点击事件
- (IBAction)ChooseBtn:(UIButton *)button {
    NSInteger n = button.tag - 1000;
    [UIView animateWithDuration:0.1 animations:^{
        CGRect seed = _lineLab.frame;
        seed.origin.x = (ScreenWidth/2) * n;
        [_lineLab setFrame:seed];
    }];
}

#pragma mark --- 城市点击事件
- (IBAction)CityBtn:(UIButton *)button {
    NSInteger n = button.tag - 100;
    for (UIButton *normalBtn in _CityBtnArray) {
        normalBtn.backgroundColor = LightGray;
    }
    UIButton *selectedBtn = _CityBtnArray[n];
    selectedBtn.backgroundColor = ZCnongzhuang;
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
