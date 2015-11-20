//
//  JointDetailsVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "JointDetailsVC.h"
#import "classVegeCell.h"
#import "ZZStringSize.h"

@interface JointDetailsVC () <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *classArray;
    UIView *boxV;
}
@end

@implementation JointDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setBombox];
}

- (void)userInterface {
    self.title = @"三人联合";
    [self setNavLeftBtnWithImg];
    
    classArray = [[NSArray alloc] initWithObjects:@"土豆",@"花菜",@"番茄", nil];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 140)];
    view.backgroundColor = color(255, 255, 255, 1);
    [self.view addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 120)];
    imageV.image = [UIImage imageNamed:@"小白菜1.jpg"];
    [view addSubview:imageV];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, ScreenWidth-150, 20)];
    name.text = @"三人联合";
    name.textColor = ZCnongzhuang;
    name.font = [UIFont systemFontOfSize:13];
    [view addSubview:name];
    
    UILabel *clsaa = [[UILabel alloc] initWithFrame:CGRectMake(140, 30, ScreenWidth-150, 18)];
    clsaa.text = @"种植种类：";
    clsaa.textColor = [UIColor blackColor];
    clsaa.font = [UIFont systemFontOfSize:12];
    [view addSubview:clsaa];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-90, 110, 80, 20)];
    button.backgroundColor = color(240, 116, 11, 1);
    [button setTitle:@"种植" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    for (int i=0; i<4; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(195, 30+i*18, ScreenWidth-205, 18)];
        label.textColor = detailsColor;
        label.font = [UIFont systemFontOfSize:12];
        [view addSubview:label];
        
        switch (i) {
            case 0:
                label.text = @"甜椒（逗逗）";
                break;
                case 1:
                label.text = @"小白菜";
                break;
                case 2:
                label.text = @"土豆";
                break;
                case 3:
                label.text = @"番茄";
                break;
                
            default:
                break;
        }
    }
    
}
#pragma mark -- 布局弹出框
- (void)setBombox {
    
    boxV = [[UIView alloc] initWithFrame:CGRectMake(50, 25, ScreenWidth-100, 280)];
    boxV.backgroundColor = [UIColor whiteColor];
    boxV.hidden = YES;
    [self.view addSubview:boxV];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 30)];
    label1.backgroundColor = ZCnongzhuang;
    label1.text = @" 请选择你要种植的种子以及种植方式";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:11];
    [boxV addSubview:label1];
    
    UITableView *mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth-100, 90) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [boxV addSubview:mainTV];
    
    UIView *delegateV = [[UIView alloc] initWithFrame:CGRectMake(0, 130, ScreenWidth-100, 110)];
    delegateV.backgroundColor = color(249, 249, 249, 1);
    [boxV addSubview:delegateV];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 30)];
    label2.text = @"全权委托";
    label2.textColor = ZCnongzhuang;
    label2.font = [UIFont systemFontOfSize:14];
    [delegateV addSubview:label2];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-160, 5, 50, 20)];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.backgroundColor = color(240, 116, 11, 1);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"选择" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(delegateBT) forControlEvents:UIControlEventTouchUpInside];
    [delegateV addSubview:button];
    
    UILabel *labelText = [[UILabel alloc] init];
    labelText.text = @"你的种植过程全权由我们来完成，待作物收获过后，我们会根据你的选择进行处理。在种植的过程中，我们会以短信的方式提醒你我们将在何时对你的农场进行管理！最后我们将收取作物总价值的50%作为农场工人的劳务费和农场管理费。";
    labelText.textColor = [UIColor blackColor];
    labelText.numberOfLines =0;
    labelText.font = [UIFont systemFontOfSize:10];
    
    CGSize textCG = [ZZStringSize getSizeToString:labelText.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-125, 75) lineBreakMode:NSLineBreakByCharWrapping];
    labelText.frame = CGRectMake(15, 30, ScreenWidth-125, textCG.height);
    
    [delegateV addSubview:labelText];
    
    UIButton *confirmBT = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-200)/2, 250, 100, 20)];
    confirmBT.titleLabel.font = [UIFont systemFontOfSize:13];
    confirmBT.backgroundColor = color(240, 116, 11, 1);
    [confirmBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBT setTitle:@"确认联合" forState:UIControlStateNormal];
    [confirmBT addTarget:self action:@selector(confirmBT) forControlEvents:UIControlEventTouchUpInside];
    [boxV addSubview:confirmBT];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    classVegeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[classVegeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.nameLa.text = classArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
#pragma mark -- 种植的按钮
- (void)button {
    boxV.hidden = NO;
}

#pragma mark -- 委托里面的按钮
- (void)delegateBT {
    
}
#pragma mark -- 确定按钮
- (void)confirmBT {
    boxV.hidden = YES;
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
