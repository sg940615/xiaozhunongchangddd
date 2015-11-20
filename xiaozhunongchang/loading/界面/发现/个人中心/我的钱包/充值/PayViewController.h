//
//  PayViewController.h
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FatherVC.h"

@interface PayViewController : FatherVC
@property (strong, nonatomic) IBOutlet UITableView *PayTableView;
@property (strong, nonatomic) IBOutlet UIView *footerView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIView *payView;
@property (strong, nonatomic) IBOutlet UIButton *yiyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *wuyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *shiyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *ershiyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *sanshiyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *wushiyuanBtn;
@property (strong, nonatomic) IBOutlet UIButton *yibaiyuanBtn;

@end
