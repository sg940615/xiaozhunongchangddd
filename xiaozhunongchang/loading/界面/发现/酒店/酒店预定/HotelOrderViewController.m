//
//  HotelOrderViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "HotelOrderViewController.h"

@interface HotelOrderViewController ()

@end

@implementation HotelOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"提交订单";
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view from its nib.
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
