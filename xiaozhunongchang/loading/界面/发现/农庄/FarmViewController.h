//
//  FarmViewController.h
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FatherVC.h"

@interface FarmViewController : FatherVC
@property (strong, nonatomic) IBOutlet UIView *header;

@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) IBOutlet UIButton *zunyiBtn;
@property (strong, nonatomic) IBOutlet UIButton *xishuiBtn;
@property (strong, nonatomic) IBOutlet UIButton *yibinBtn;

@property (strong, nonatomic) IBOutlet UIButton *menuBtn;

@property (strong, nonatomic) IBOutlet UIButton *taocanBtn;
@property (strong, nonatomic) IBOutlet UILabel *lineLab;

@end
