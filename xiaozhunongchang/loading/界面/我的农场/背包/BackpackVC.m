//
//  BackpackVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "BackpackVC.h"
#import "MyFarmVC.h"
#import "SeedVC.h"
#import "FarmMenuCell.h"

@interface BackpackVC () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *menuTV;
    NSArray *imgArray;
    NSArray *nameArray;
}
@end

@implementation BackpackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeft];
    [self userInterface];
}

- (void)setNavLeft {
    self.title = @"背包";
    
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

- (void)userInterface {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == menuTV) {
        return 4;
    }else {
        return 10;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MyFarmVC *Fvc = [[MyFarmVC alloc] initWithNibName:@"MyFarmVC" bundle:nil];
        [self.navigationController pushViewController:Fvc animated:YES];
        
    }else if (indexPath.row == 1) {
        
        SeedVC *sVC = [[SeedVC alloc] initWithNibName:@"SeedVC" bundle:nil];
        sVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sVC animated:YES];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect menu = menuTV.frame;
        menu.origin.x = -90;
        [menuTV setFrame:menu];
    }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *ID = @"cell";
//    if (tableView == menuTV) {
    
        FarmMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[FarmMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        cell.imageV.image = [UIImage imageNamed:imgArray[indexPath.row]];
        cell.name.text = nameArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        }
    return cell;
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
