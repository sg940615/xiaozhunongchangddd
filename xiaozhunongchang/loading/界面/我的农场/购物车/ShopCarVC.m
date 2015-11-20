//
//  ShopCarVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ShopCarVC.h"
#import "ShopCarCell.h"
#import "ConfirmOrderTV.h"

@interface ShopCarVC () <UITableViewDataSource,UITableViewDelegate,Countdelegate>
{
    UIButton *selsetBT;
    ShopCarCell *cell;
    UITableView *mainTV;
}
@end

@implementation ShopCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
}

- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"购物车";
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
    mainTV.backgroundColor = color(242, 242, 242, 0.7);
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    view.backgroundColor = color(183, 184, 184, 1);
    [self.view addSubview:view];
    
    selsetBT = [[UIButton alloc] initWithFrame:CGRectMake( 25, 12.5, 15, 15)];
    [selsetBT setImage:[UIImage imageNamed:@"购物车_06"] forState:UIControlStateNormal];
    [selsetBT setImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
    [selsetBT addTarget:self action:@selector(selsetBT:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:selsetBT];
    //全选
    UILabel *select = [[UILabel alloc] initWithFrame:CGRectMake(42, 12.5, 25, 15)];
    select.text = @"全选";
    select.font = [UIFont systemFontOfSize:11];
    [view addSubview:select];
    //总额
    UILabel *toatl = [[UILabel alloc] initWithFrame:CGRectMake(77, 10, 120, 20)];
    toatl.text = @"总额：¥40.00";
    toatl.textColor = priceLaColor;
    toatl.font = [UIFont systemFontOfSize:13];
    [view addSubview:toatl];
    //结算
    UIButton *orderBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-70, 10, 60, 20)];
    orderBT.backgroundColor = ZCnongzhuang;
    [orderBT setTitle:@"结算" forState:UIControlStateNormal];
    [orderBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderBT.titleLabel setFont:[UIFont systemFontOfSize:10]];
    [orderBT addTarget:self action:@selector(orderBT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:orderBT];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ShopCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.Countdelegate = self;
    cell.imageV.image = [UIImage imageNamed:@"西红柿1.jpg"];
    cell.nameLa.text = @"西红柿种子";
    cell.priceLa.text = @"¥20.00";
    cell.toatlLa.text = @"小计¥40.00";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)selsetBT:(UIButton *)button {
    
    if (button.selected) {
        selsetBT.selected = NO;
    }else {
        selsetBT.selected = YES;
    }

}

- (UITableViewCell *)Count {
    
    CGFloat zz = cell.count*40;
    cell.toatlLa.text = [NSString stringWithFormat:@"小计¥%2.f",zz];
    [mainTV reloadData];
    return cell;
}

- (void)orderBT {
    
    ConfirmOrderTV *Ctv = [[ConfirmOrderTV alloc] initWithNibName:@"ConfirmOrderTV" bundle:nil];
    [self.navigationController pushViewController:Ctv animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
