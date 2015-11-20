//
//  PayViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController () <UITableViewDataSource,UITableViewDelegate>
//背景视图
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) NSMutableArray *ChooseBtnArray;
@property (nonatomic, strong) NSString *xiaozhubi;
@property (nonatomic, strong) NSString *price;

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"充值";
    self.hidesBottomBarWhenPushed = YES;
    _ChooseBtnArray = [NSMutableArray array];
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
    _backgroundView.hidden = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked)];
    [_backgroundView addGestureRecognizer:tap];
    _payView.center = _backgroundView.center;
    [_backgroundView addSubview:_payView];
    
    [_ChooseBtnArray addObject:_yiyuanBtn];
    [_ChooseBtnArray addObject:_wuyuanBtn];
    [_ChooseBtnArray addObject:_shiyuanBtn];
    [_ChooseBtnArray addObject:_ershiyuanBtn];
    [_ChooseBtnArray addObject:_sanshiyuanBtn];
    [_ChooseBtnArray addObject:_wushiyuanBtn];
    [_ChooseBtnArray addObject:_yibaiyuanBtn];
    _xiaozhubi = @"100小猪币";
    _price = @"优惠价:10.00";
}

- (void)tapClicked {
    _backgroundView.hidden = YES;
    [_PayTableView reloadData];
}

- (IBAction)chooseBtn:(UIButton *)button {
    NSInteger n = button.tag - 300;
    for (UIButton *normalBtn in _ChooseBtnArray) {
        [normalBtn setImage:[UIImage imageNamed:@"充值_06.png"] forState:UIControlStateNormal];
    }
    UIButton *selectedBtn = _ChooseBtnArray[n];
    [selectedBtn setImage:[UIImage imageNamed:@"充值_03.png"] forState:UIControlStateNormal];
    NSDictionary *xiaozhubiDic = @{@"0":@"10小猪币",@"1":@"50小猪币",@"2":@"100小猪币",@"3":@"200小猪币",@"4":@"300小猪币",@"5":@"500小猪币",@"6":@"1000小猪币"};
    NSDictionary *priceDic = @{@"0":@"优惠价:1.00",@"1":@"优惠价:5.00",@"2":@"优惠价:10.00",@"3":@"优惠价:20.00",@"4":@"优惠价:30.00",@"5":@"优惠价:50.00",@"6":@"优惠价:100.00"};
    _xiaozhubi = [xiaozhubiDic objectForKey:[NSString stringWithFormat:@"%d",n]];
    _price = [priceDic objectForKey:[NSString stringWithFormat:@"%d",n]];
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
    cell.textLabel.text = _xiaozhubi;
    cell.detailTextLabel.text = _price;
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
