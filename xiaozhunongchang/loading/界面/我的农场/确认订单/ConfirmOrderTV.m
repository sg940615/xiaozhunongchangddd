//
//  ConfirmOrderTV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ConfirmOrderTV.h"
#import "QROrderCell.h"

@interface ConfirmOrderTV () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTV;
}
@end

@implementation ConfirmOrderTV

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
}

- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"确认订单";
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
    mainTV.backgroundColor = color(242, 242, 242, 1);
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    view.backgroundColor = color(182, 183, 183, 1);
    [self.view addSubview:view];
    //价格
    UILabel *toatl = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 120, 20)];
    toatl.text = @"总额：¥40.00";
    toatl.textColor = priceLaColor;
    toatl.font = [UIFont systemFontOfSize:13];
    [view addSubview:toatl];
    //提交订单
    UIButton *orderBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-70, 10, 60, 20)];
    orderBT.backgroundColor = ZCnongzhuang;
    [orderBT setTitle:@"提交订单" forState:UIControlStateNormal];
    [orderBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderBT.titleLabel setFont:[UIFont systemFontOfSize:10]];
    [orderBT addTarget:self action:@selector(orderBT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:orderBT];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    QROrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QROrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.nameLa.text = @"西红柿种子";
    cell.imageV.image = [UIImage imageNamed:@"西红柿1.jpg"];
    cell.priceLa.text = @"¥15.00";
    cell.numLa.text = @"X1";
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)orderBT {
    
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
