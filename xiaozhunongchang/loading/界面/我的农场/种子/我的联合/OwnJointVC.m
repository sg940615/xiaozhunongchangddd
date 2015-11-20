//
//  OwnJointVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "OwnJointVC.h"
#import "OwnJointCell.h"

@interface OwnJointVC () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mainTV;
}
@end

@implementation OwnJointVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setButton];
    
}

- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"我的联合";
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
}

- (void)setButton {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    [button setTitle:@"取消联合" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = color(134, 134, 134, 1);
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    OwnJointCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[OwnJointCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageV.image = [UIImage imageNamed:@"小白菜1.jpg"];
    cell.nameLa.text = @"两人联合";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (void)button {
    
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
