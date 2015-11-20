//
//  SeedVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "SeedVC.h"
#import "OwnSeedCell.h"
#import "ZZStringSize.h"
#import "JointFarmCell.h"
#import "JointDetailsVC.h"
#import "OwnJointVC.h"
#import "ReleaseJointVC.h"
#import "MalldetailsVC.h"
#import "FarmMenuCell.h"
#import "BackpackVC.h"
#import "MyFarmVC.h"

@interface SeedVC () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JointDelegate,Seeddelegate>
{
    UIButton *lastBT1;
    UIButton *lastBT2;
    UIButton *lastBT3;
    UIButton *lastBT4;
    UILabel *lineLa;
    UIView *view;
    UIScrollView *mainSV;
    UITableView *farmTV;
    JointFarmCell *cell;
    UIView *RuleView;
    UITableView *menuTV;
    NSArray *imgArray;
    NSArray *nameArray;
}
@end

@implementation SeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self seedClass];
    [self setSeason];
    [self setTableView];
    [self setFarm];
    [self setButton];
    [self setRuleView];
    [self setNavLeft];
}

#pragma mark -- 设置第一行选项
- (void)userInterface {
    self.title = @"选购种子";
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 32, ScreenWidth, ScreenHeight-96)];
    mainSV.contentSize = CGSizeMake(ScreenWidth*2, ScreenHeight-96);
    mainSV.showsHorizontalScrollIndicator = NO;
    mainSV.pagingEnabled = YES;
    mainSV.delegate = self;
    [self.view addSubview:mainSV];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-45, 0, 30, 30)];
    imageV.image = [UIImage imageNamed:@"关注_03"];
    [self.view addSubview:imageV];
    
    for (int i=0; i<2; i++) {
        
        UIButton *seedBT = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-55)/2*i, 0, (ScreenWidth-55)/2, 30)];
        [seedBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        seedBT.tag = 1000+i;
        [seedBT setTitleColor:ZCnongzhuang forState:UIControlStateSelected];
        seedBT.titleLabel.font = [UIFont systemFontOfSize:14];
        [seedBT addTarget:self action:@selector(seedBT:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:seedBT];
        switch (i) {
            case 0:
                [seedBT setTitle:@"自选种子" forState:UIControlStateNormal];
                seedBT.selected = YES;
                lastBT1 = seedBT;
                break;
                case 1:
                [seedBT setTitle:@"联合农场" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
    
    lineLa = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, (ScreenWidth-55)/2, 2)];
    lineLa.backgroundColor = ZCnongzhuang;
    [self.view addSubview:lineLa];

}

- (void)setNavLeft {
    
    UIBarButtonItem *leftNav = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"农场(1)_03"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAc)];
    leftNav.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftNav;
    
    menuTV = [[UITableView alloc] initWithFrame:CGRectMake(-90, 0, 90, 200) style:UITableViewStylePlain];
    menuTV.backgroundColor = color(82, 85, 85, 0.7);
    menuTV.delegate = self;
    menuTV.dataSource = self;
    menuTV.showsVerticalScrollIndicator = NO;
    menuTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self setBorder:menuTV size:1 withColor:color(62, 65, 66, 1)];
    [self.view addSubview:menuTV];
    
    imgArray = [[NSArray alloc] initWithObjects:@"农场(1)_07",@"农场(1)_10",@"农场(1)_12",@"农场(1)_14", nil];
    nameArray = [[NSArray alloc] initWithObjects:@"视频",@"种子",@"背包",@"土地运营", nil];
}

#pragma mark -- 种子分类
- (void)seedClass {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 29)];
    label.text = @"种子分类：";
    label.textColor = color(93, 93, 93, 1);
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
    UILabel *lineLa2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 31, ScreenWidth-10, 1)];
    lineLa2.backgroundColor = color(206, 206, 206, 1);
    [view addSubview:lineLa2];
    
    for (int i=0 ; i<3; i++) {
        UIButton *classBT = [[UIButton alloc] initWithFrame:CGRectMake(60+(52*i), 7, 45, 15)];
        [classBT setTitleColor:color(80, 81, 81, 1) forState:UIControlStateNormal];
        classBT.backgroundColor = color(200, 203, 202, 1);
        classBT.titleLabel.font = [UIFont systemFontOfSize:10];
        [classBT addTarget:self action:@selector(classBT:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:classBT];
        switch (i) {
            case 0:
                [classBT setTitle:@"蔬菜类" forState:UIControlStateNormal];
                classBT.selected = YES;
                lastBT2 = classBT;
                classBT.backgroundColor = ZCnongzhuang;
                break;
                case 1:
                [classBT setTitle:@"水果类" forState:UIControlStateNormal];
                break;
                case 2:
                [classBT setTitle:@"其他类" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
    
}

#pragma mark -- 设置种植月份
- (void)setSeason {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 50, 29)];
    label.text = @"种植月份：";
    label.textColor = color(93, 93, 93, 1);
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
    UILabel *lineLa2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 59, ScreenWidth-10, 1)];
    lineLa2.backgroundColor = color(206, 206, 206, 1);
    [view addSubview:lineLa2];
    
    for (int i=0 ; i<4; i++) {
        UIButton *SeasonBT = [[UIButton alloc] initWithFrame:CGRectMake(60+(52*i), 37, 45, 15)];
        [SeasonBT setTitleColor:color(80, 81, 81, 1) forState:UIControlStateNormal];
        SeasonBT.backgroundColor = color(200, 203, 202, 1);
        SeasonBT.titleLabel.font = [UIFont systemFontOfSize:10];
        [SeasonBT addTarget:self action:@selector(SeasonBT:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:SeasonBT];
        switch (i) {
            case 0:
                [SeasonBT setTitle:@"春季" forState:UIControlStateNormal];
                break;
            case 1:
                [SeasonBT setTitle:@"夏季" forState:UIControlStateNormal];
                SeasonBT.selected = YES;
                lastBT3 = SeasonBT;
                SeasonBT.backgroundColor = ZCnongzhuang;
                break;
            case 2:
                [SeasonBT setTitle:@"秋季" forState:UIControlStateNormal];
                break;
            case 3:
                [SeasonBT setTitle:@"冬季" forState:UIControlStateNormal];
            default:
                break;
        }
    }

    
}

#pragma mark -- 设置自选种子的TableView
- (void)setTableView {
   
    UITableView *mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, ScreenWidth, ScreenHeight-156) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [mainSV addSubview:mainTV];
    
}

#pragma mark -- 设置联合农场
- (void)setFarm {
    
    UIView *viewF = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, 30)];
    viewF.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:viewF];
    
    CGFloat JJ = (ScreenWidth-180)/5;
    
    for (int i=0; i<4; i++) {
        UIButton *buttonF = [[UIButton alloc] initWithFrame:CGRectMake(JJ+(JJ+45)*i, 7.5, 45, 15)];
        buttonF.backgroundColor = color(200, 203, 202, 1);
        [buttonF setTitleColor:color(80, 81, 81, 1) forState:UIControlStateNormal];
        buttonF.titleLabel.font = [UIFont systemFontOfSize:9];
        buttonF.tag = 1002+i;
        [buttonF addTarget:self action:@selector(buttonF:) forControlEvents:UIControlEventTouchUpInside];
        [viewF addSubview:buttonF];
        switch (i) {
            case 0:
                [buttonF setTitle:@"二人联合" forState:UIControlStateNormal];
                buttonF.selected = YES;
                lastBT4 = buttonF;
                buttonF.backgroundColor = ZCnongzhuang;
                break;
            case 1:
                [buttonF setTitle:@"三人联合" forState:UIControlStateNormal];
                
                break;
            case 2:
                [buttonF setTitle:@"四人联合" forState:UIControlStateNormal];
                break;
            case 3:
                [buttonF setTitle:@"联合规则" forState:UIControlStateNormal];
            default:
                break;
        }

    }
    
    farmTV = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth, 30, ScreenWidth, ScreenHeight-166) style:UITableViewStylePlain];
    farmTV.delegate = self;
    farmTV.dataSource = self;
    farmTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [mainSV addSubview:farmTV];
    
}

#pragma mark -- 设置底部Button
- (void)setButton {
    
    UIView *butV = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, ScreenHeight-136, ScreenWidth, 40)];
    butV.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:butV];
    
    UIButton *ownBT = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, (ScreenWidth-40)/2, 30)];
    ownBT.backgroundColor = color(199, 202, 201, 1);
    [ownBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ownBT setTitle:@"我的联合" forState:UIControlStateNormal];
    ownBT.titleLabel.font = [UIFont systemFontOfSize:12];
    [ownBT addTarget:self action:@selector(ownBT) forControlEvents:UIControlEventTouchUpInside];
    [butV addSubview:ownBT];
    
    UIButton *releaseBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-(ScreenWidth-40)/2-10, 5, (ScreenWidth-40)/2, 30)];
    releaseBT.backgroundColor = color(240, 116, 11, 1);
    [releaseBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [releaseBT setTitle:@"发布联合" forState:UIControlStateNormal];
    releaseBT.titleLabel.font = [UIFont systemFontOfSize:12];
    [releaseBT addTarget:self action:@selector(releaseBT) forControlEvents:UIControlEventTouchUpInside];
    [butV addSubview:releaseBT];
}

#pragma mark -- 联合规则
- (void)setRuleView {
    
    RuleView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 60, ScreenWidth, ScreenHeight-124)];
    RuleView.backgroundColor = color(249, 249, 249, 1);
    [self.view addSubview:RuleView];
    
    UIView *textV = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 200)];
    textV.backgroundColor = color(255, 255, 255, 1);
    [RuleView addSubview:textV];
    
    UILabel *ruleLa = [[UILabel alloc] init];
    ruleLa.text = @"为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。为了农场的统一性，规范性和可靠性；我们为大家推出”小猪联盟“即“联合农场”。";
    ruleLa.textColor = detailsColor;
    ruleLa.font = [UIFont systemFontOfSize:10];
    ruleLa.numberOfLines = 0;
    
    CGSize ruleCG = [ZZStringSize getSizeToString:ruleLa.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-20, 170) lineBreakMode:NSLineBreakByCharWrapping];
    ruleLa.frame = CGRectMake(10, 20, ScreenWidth-20, ruleCG.height);
    [textV addSubview:ruleLa];
}

#pragma mark -- 滑动页面跳转选项
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIButton *button1 = (UIButton *)[self.view viewWithTag:1000];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:1001];
    
    if (scrollView == mainSV) {
        
        [UIView animateWithDuration:0.1 animations:^{
        CGRect seed = lineLa.frame;
        
        if (scrollView.contentOffset.x == 0) {
            button1.selected = YES;
            button2.selected = NO;
            seed.origin.x = 0;
            [lineLa setFrame:seed];
        }else if (scrollView.contentOffset.x == ScreenWidth) {
            button1.selected = NO;
            button2.selected = YES;
            seed.origin.x = (ScreenWidth-55)/2;
            [lineLa setFrame:seed];
        }
    }];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == menuTV) {
        return 4;
    }else {
        return 12;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == menuTV) {
        
        if (indexPath.row == 2) {
        
        BackpackVC *bpVC = [[BackpackVC alloc] initWithNibName:@"BackpackVC" bundle:nil];
        bpVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bpVC animated:YES];
    }else if (indexPath.row == 3) {
        
        SeedVC *sVC = [[SeedVC alloc] initWithNibName:@"SeedVC" bundle:nil];
        sVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sVC animated:YES];
    }else if (indexPath.row == 0) {
        
        MyFarmVC *mVC = [[MyFarmVC alloc] initWithNibName:@"MyFarmVC" bundle:nil];
        [self.navigationController pushViewController:mVC animated:YES];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect menu = menuTV.frame;
        menu.origin.x = -90;
        [menuTV setFrame:menu];
    }];
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == farmTV) {
        return 150;
    }else if (tableView == menuTV){
        return 50;
    }else {
        return 120;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == farmTV) {
        
        static NSString *ID = @"cell";
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[JointFarmCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        cell.JointDelegate = self;
        cell.imageV.image = [UIImage imageNamed:@"小白菜1.jpg"];
        cell.nameLa.text = @"二人联合";
        cell.classLa.text = @"甜椒，小白菜，土豆";
        cell.timeLa.text = @"2015.10.11";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (tableView == menuTV) {
        
        static NSString *ID = @"Menucell";
        FarmMenuCell *Menucell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!Menucell) {
            Menucell = [[FarmMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        Menucell.imageV.image = [UIImage imageNamed:imgArray[indexPath.row]];
        Menucell.name.text = nameArray[indexPath.row];
        Menucell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Menucell;
        
        
    
        
    }else {
        
        static NSString *ID = @"Seedcell";
        OwnSeedCell *Seedcell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!Seedcell) {
            Seedcell = [[OwnSeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        Seedcell.Seeddelegate = self;
        Seedcell.imageV.image = [UIImage imageNamed:@"西红柿1.jpg"];
        Seedcell.nameLa.text = @"西红柿";
        Seedcell.timeLa.text = @"生长周期：2~3个月";
        Seedcell.detailsLa.text = @"营养成分：丰富的维生素，少量蛋白质，美容瘦身达人首选。";
        Seedcell.priceLa.text = @"￥20.00";
    
        CGSize detailsCG = [ZZStringSize getSizeToString:Seedcell.detailsLa.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-138, 30) lineBreakMode:NSLineBreakByCharWrapping];
        Seedcell.detailsLa.frame = CGRectMake(118, 45, ScreenWidth-138, detailsCG.height);
        Seedcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return Seedcell;
    }
    

}
#pragma mark -- 联合农场里的联合按钮
- (void)buttonF:(UIButton *)button {
    
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT4.selected = NO;
        lastBT4.backgroundColor = color(200, 203, 202, 1);
        lastBT4 = button;
    }
    
    [UIView animateWithDuration:0.35 animations:^{
        CGRect rule = RuleView.frame;
        
        if (button.tag == 1005) {
            if (rule.origin.x == ScreenWidth) {
            rule.origin.x = 0;
            [RuleView setFrame:rule];
        }else {
            rule.origin.x = ScreenWidth;
            [RuleView setFrame:rule];
           }
        }else {
            rule.origin.x = ScreenWidth;
            [RuleView setFrame:rule];
        }
        
    }];
    
}
#pragma mark -- 自选种子按钮
- (void)seedBT:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        lastBT1.selected = NO;
        lastBT1 = button;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        CGRect seed = lineLa.frame;
        if (button.tag == 1000) {
            seed.origin.x = 0;
            [lineLa setFrame:seed];
            
        }else {
            seed.origin.x = (ScreenWidth-55)/2;
            [lineLa setFrame:seed];
        }
    }];
    
    [UIView animateWithDuration:0.35 animations:^{
        if (button.tag == 1000) {
            CGPoint main = mainSV.contentOffset;
            CGRect rule = RuleView.frame;
            main.x = 0;
            [mainSV setContentOffset:main];
            rule.origin.x = ScreenWidth;
            [RuleView setFrame:rule];
            
        }else {
            CGPoint main = mainSV.contentOffset;
            main.x = ScreenWidth;
            [mainSV setContentOffset:main];
        }
    }];
}
#pragma mark -- 种子分类按钮
- (void)classBT:(UIButton *)button {
    
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT2.selected = NO;
        lastBT2.backgroundColor = color(200, 203, 202, 1);
        lastBT2 = button;
    }
}

#pragma mark -- 种植月份按钮
- (void)SeasonBT:(UIButton *)button {
    
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT3.selected = NO;
        lastBT3.backgroundColor = color(200, 203, 202, 1);
        lastBT3 = button;
    }
}

#pragma mark -- 我的联合按钮
- (void)ownBT {
    
    OwnJointVC *Ovc = [[OwnJointVC alloc] initWithNibName:@"OwnJointVC" bundle:nil];
    [self.navigationController pushViewController:Ovc animated:YES];
}

#pragma mark -- 我的发布按钮
- (void)releaseBT {
    
    ReleaseJointVC *Rvc = [[ReleaseJointVC alloc] initWithNibName:@"ReleaseJointVC" bundle:nil];
    [self.navigationController pushViewController:Rvc animated:YES];
}

#pragma mark -- 立即加入按钮
- (void)nextJoint {
    
    JointDetailsVC *Jvc = [[JointDetailsVC alloc] initWithNibName:@"JointDetailsVC" bundle:nil];
    [self.navigationController pushViewController:Jvc animated:YES];
}

#pragma mark -- 种子详情
- (void)nextSeedDetails {
    MalldetailsVC *Mvc = [[MalldetailsVC alloc] initWithNibName:@"MalldetailsVC" bundle:nil];
    [self.navigationController pushViewController:Mvc animated:YES];
}

- (void)leftAc {
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect menu = menuTV.frame;
        if (menu.origin.x == 0) {
            menu.origin.x = -90;
            [menuTV setFrame:menu];
        }else {
            menu.origin.x = 0;
            [menuTV setFrame:menu];
        }
    }];
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
