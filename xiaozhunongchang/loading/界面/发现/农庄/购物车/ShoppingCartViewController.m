//
//  ShoppingCartViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) NSInteger numStr;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.title = @"购物车";
    [self setNavLeftBtnWithImg];
    _numStr = 1;
    // Do any additional setup after loading the view from its nib.
    _shoppingcartTableView.delegate = self;
    _shoppingcartTableView.dataSource = self;
    _shoppingcartTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_allChooseBtn addTarget:self action:@selector(allChooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_allChooseBtn setImage:[UIImage imageNamed:@"购物车_03.png"] forState:UIControlStateSelected];
}

#pragma mark -- 全选点击事件
- (void)allChooseBtnClicked:(UIButton *)button {
    button.selected = !button.selected;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShoppingCartCell" owner:nil options:nil] lastObject];
    }
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //勾选
    UIButton *chooseBtn = (UIButton *)[cell viewWithTag:100];
    [chooseBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [chooseBtn setImage:[UIImage imageNamed:@"购物车_03.png"] forState:UIControlStateSelected];
    
    //加号
    UIButton *addBtn = (UIButton *)[cell viewWithTag:106];
    [addBtn addTarget:self action:@selector(addClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //数量
    UILabel *numLab = (UILabel *)[cell viewWithTag:105];
    numLab.text = [NSString stringWithFormat:@"%ld",_numStr];
    
    //减号
    UIButton *minusBtn = (UIButton *)[cell viewWithTag:104];
    [minusBtn addTarget:self action:@selector(minusClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *totlaPriceLab = (UILabel *)[cell viewWithTag:103];
//    totlaPriceLab.text = 
    
    return cell;
}

#pragma mark -- 选择点击事件
- (void)chooseBtn:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)addClicked:(UIButton *)button {
    _numStr ++;
    UITableViewCell *cell = (UITableViewCell *)button.superview.superview.superview.superview;
    NSIndexPath *index = [_shoppingcartTableView indexPathForCell:cell];
    NSLog(@"%ld",(long)index.row);
    UILabel *label = (UILabel *)[cell viewWithTag:105];
    label.text = [NSString stringWithFormat:@"%ld",_numStr];
    [_shoppingcartTableView reloadData];
}

- (void)minusClicked:(UIButton *)button {
    if (_numStr != 1) {
        _numStr --;
        [_shoppingcartTableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}



@end
