//
//  HotelInformationViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "HotelInformationViewController.h"
#import "HotelOrderViewController.h"

@interface HotelInformationViewController ()

@end

@implementation HotelInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"酒店详情";
    // Do any additional setup after loading the view from its nib.
}

#pragma mark --- 预定
- (IBAction)orderRoom:(id)sender {
    HotelOrderViewController *hotelOrder = [[HotelOrderViewController alloc] init];
    [self.navigationController pushViewController:hotelOrder animated:YES];
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
