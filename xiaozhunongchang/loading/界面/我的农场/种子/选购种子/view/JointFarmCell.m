//
//  JointFarmCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "JointFarmCell.h"
#import "Defines.h"

@interface JointFarmCell ()
{
    UIView *view;
    UILabel *class;
    UILabel *friend;
    UIButton *button;
}
@end
@implementation JointFarmCell
@synthesize imageV,nameLa,timeLa,classLa,friendLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.backgroundColor = color(249, 249, 249, 1);
    }
    return self;
}

- (void)setup {
    
    view = [[UIView alloc] init];
    view.backgroundColor = color(255, 255, 255, 1);
    [self.contentView addSubview:view];
    
    imageV = [[UIImageView alloc] init];
    [view addSubview:imageV];
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:13];
    nameLa.textColor = ZCnongzhuang;
    [view addSubview:nameLa];
    
    class = [[UILabel alloc] init];
    class.font = [UIFont systemFontOfSize:10];
    class.text = @"种植种类：";
    class.textColor = [UIColor blackColor];
    [view addSubview:class];
    
    friend = [[UILabel alloc] init];
    friend.font = [UIFont systemFontOfSize:10];
    friend.text = @"合作伙伴：";
    friend.textColor = [UIColor blackColor];
    [view addSubview:friend];
    
    timeLa = [[UILabel alloc] init];
    timeLa.font = [UIFont systemFontOfSize:10];
    timeLa.textColor = detailsColor;
    timeLa.textAlignment = NSTextAlignmentRight;
    [view addSubview:timeLa];
    
    classLa = [[UILabel alloc] init];
    classLa.font = [UIFont systemFontOfSize:10];
    classLa.textColor = detailsColor;
    [view addSubview:classLa];
    
    
    for (int i=0; i<3; i++) {
        
    classLa = [[UILabel alloc] initWithFrame:CGRectMake(190, 45+15*i, ScreenWidth-198, 15)];
    classLa.font = [UIFont systemFontOfSize:10];
    classLa.textColor = detailsColor;
    [view addSubview:classLa];
    }
    
    
    button = [[UIButton alloc] init];
    button.backgroundColor = color(240, 116, 11, 1);
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    [button setTitle:@"立即加入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    view.frame = CGRectMake(0, 10, ScreenWidth, 140);
    imageV.frame = CGRectMake(10, 10, 120, 120);
    nameLa.frame = CGRectMake(140, 10, 60, 20);
    timeLa.frame = CGRectMake(ScreenWidth-108, 10, 100, 20);
    class.frame = CGRectMake(140, 30, 50, 15);
    classLa.frame = CGRectMake(190, 30, ScreenWidth-198, 15);
    friend.frame = CGRectMake(140, 45, 50, 15);
    button.frame = CGRectMake(ScreenWidth-110, 110, 100, 20);
    
}


- (void)button {
    
    [self.JointDelegate nextJoint];
}

@end
