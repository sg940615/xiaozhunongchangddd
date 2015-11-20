//
//  ReleaseJointVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ReleaseJointVC.h"
#import "ReleaseCell.h"
#import "ZZStringSize.h"
#import "selectSeedV.h"
#import "classVegeCell.h"

@interface ReleaseJointVC () <UITableViewDelegate,UITableViewDataSource>
{
    UIButton *lastBT1;
    UIButton *lastBT2;
    UIButton *lastBT3;
    selectSeedV *selectV;
    UITableView *vegeTV;
    NSArray *classVegeArray;
}
@end

@implementation ReleaseJointVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setSelectSeed];
    [self setTableView];
    [self setButton];
    [self setTankuang];
}


- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"发布联合";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 8, ScreenWidth, 30)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *wayLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 77, 30)];
    wayLa.text = @"选择联合方式：";
    wayLa.font = [UIFont systemFontOfSize:11];
    [view addSubview:wayLa];
    
    NSArray *wayArray = [[NSArray alloc] initWithObjects:@"二人联合",@"三人联合",@"四人联合", nil];
    [self setClass:wayArray setStar:87 setSpac:20 setHeight:7.5 setV:view setLast:lastBT1 action:@selector(jointBT:)];
}
#pragma mark -- 设置前面标题
- (void)setSelectSeed {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 46, ScreenWidth, 85)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *seedLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 55, 25)];
    seedLa.text = @"选择种子：";
    seedLa.font = [UIFont systemFontOfSize:11];
    [view addSubview:seedLa];
    
    UILabel *classLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 45, 25)];
    classLa.text = @"种子分类：";
    classLa.font = [UIFont systemFontOfSize:9];
    [view addSubview:classLa];
    
    UILabel *monthLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 45, 25)];
    monthLa.text = @"选择月份：";
    monthLa.font = [UIFont systemFontOfSize:9];
    [view addSubview:monthLa];
    
    NSArray *classArray = [[NSArray alloc] initWithObjects:@"蔬菜类",@"水果类",@"其他类",nil];
    NSArray *monthArray = [[NSArray alloc] initWithObjects:@"春季",@"夏季",@"秋季",@"冬季", nil];
    
    [self setClass:classArray setStar:55 setSpac:5 setHeight:30 setV:view setLast:lastBT2 action:@selector(classBT:)];
    [self setClass:monthArray setStar:55 setSpac:5 setHeight:55 setV:view setLast:lastBT3 action:@selector(mouthBT:)];
    
}
#pragma mark --设置表格
- (void)setTableView {
    
    UITableView *mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 131, ScreenWidth, ScreenHeight-235)];
    mainTV.backgroundColor = color(249, 247, 247, 1);
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
}
#pragma mark --设置底部按钮
- (void)setButton {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    [button setTitle:@"发布联合" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = color(240, 116, 11, 1);
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

#pragma mark -- 设置弹框
- (void)setTankuang {
    
    selectV = [[selectSeedV alloc] initWithFrame:CGRectMake(50, 25, ScreenWidth-100, 280)];
    selectV.backgroundColor = [UIColor whiteColor];
    selectV.hidden = YES;
    [selectV setAction];
    [self.view addSubview:selectV];
    
    vegeTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth-100, 90) style:UITableViewStylePlain];
    vegeTV.delegate = self;
    vegeTV.dataSource = self;
    vegeTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [selectV addSubview:vegeTV];
    
    UIButton *confirmBT = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-200)/2, 250, 100, 20)];
    confirmBT.titleLabel.font = [UIFont systemFontOfSize:13];
    confirmBT.backgroundColor = color(240, 116, 11, 1);
    [confirmBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBT setTitle:@"确认发布" forState:UIControlStateNormal];
    [confirmBT addTarget:self action:@selector(confirmBT) forControlEvents:UIControlEventTouchUpInside];
    [selectV addSubview:confirmBT];
    
    classVegeArray = [[NSArray alloc] initWithObjects:@"小白菜",@"土豆",@"花菜",@"番茄", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == vegeTV) {
        return classVegeArray.count;
    }else {
        return 10;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == vegeTV) {
        return 30;
    }else {
        return 110;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == vegeTV) {
        static NSString *ID = @"cell";
        classVegeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[classVegeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        cell.nameLa.text = classVegeArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else {
        static NSString *ID = @"cell";
        ReleaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[ReleaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.imageV.image = [UIImage imageNamed:@"西红柿1.jpg"];
        cell.nameLa.text = @"西红柿";
        cell.timeLa.text = @"生长周期：2～3个月";
        cell.detailsLa.text = @"营养成分：丰富的维生素，少量蛋白质，美容瘦身达人首选";
        cell.priceLa.text = @"20.00";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        CGSize detailsCG = [ZZStringSize getSizeToString:cell.detailsLa.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-140, 30) lineBreakMode:NSLineBreakByCharWrapping];
        cell.detailsLa.frame = CGRectMake(120, 45, ScreenWidth-140, detailsCG.height);
        
        return cell;
    }
    
    
    

}

#pragma mark --按钮的布局
- (void)setClass:(NSArray *)text setStar:(CGFloat )star setSpac:(CGFloat )spac setHeight:(CGFloat )height setV:(UIView *)view setLast:(UIButton *)lastBT action:(SEL)acButton {
    
    for (int i=0; i<text.count; i++) {
        UIButton *jointBT = [[UIButton alloc] initWithFrame:CGRectMake(star+(spac+45)*i, height, 45, 15)];
        jointBT.backgroundColor = color(200, 203, 202, 1);
        [jointBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        jointBT.titleLabel.font = [UIFont systemFontOfSize:9];
        jointBT.tag = 1000+i;
        [jointBT addTarget:self action:acButton forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:jointBT];
        switch (i) {
            case 0:
                [jointBT setTitle:text[0] forState:UIControlStateNormal];
                jointBT.selected = YES;
                jointBT.backgroundColor = ZCnongzhuang;
                lastBT = jointBT;
                break;
            case 1:
                [jointBT setTitle:text[1] forState:UIControlStateNormal];
                
                break;
            case 2:
                [jointBT setTitle:text[2] forState:UIControlStateNormal];
                break;
            case 3:
                [jointBT setTitle:text[3] forState:UIControlStateNormal];
                break;
            default:
                break;
        }
       
    }
    
}

#pragma mark -- 联合按钮
- (void)jointBT:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT1.selected = NO;
        lastBT1.backgroundColor = color(200, 203, 202, 1);
        lastBT1 = button;
    }
}
#pragma mark -- 分类按钮
- (void)classBT:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT2.selected = NO;
        lastBT2.backgroundColor = color(200, 203, 202, 1);
        lastBT2 = button;
    }
    NSLog(@"222");
}
#pragma mark -- 季节按钮
- (void)mouthBT:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT3.selected = NO;
        lastBT3.backgroundColor = color(200, 203, 202, 1);
        lastBT3 = button;
    }
}
#pragma mark -- 弹框确定按钮
- (void)confirmBT {
    
    selectV.hidden =YES;
}

- (void)button {
    selectV.hidden = NO;
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
