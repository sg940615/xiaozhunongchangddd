//
//  OwnJointCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "OwnJointCell.h"
#import "Defines.h"

@interface OwnJointCell ()
{
    UIView *view;
    UILabel *classLa;
    UIButton *button;
}
@end

@implementation OwnJointCell
@synthesize nameLa,imageV;

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
    view.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:view];
    
    imageV = [[UIImageView alloc] init];
    [view addSubview:imageV];
    
    nameLa = [[UILabel alloc] init];
    nameLa.textColor = ZCnongzhuang;
    nameLa.font = [UIFont systemFontOfSize:13];
    [view addSubview:nameLa];
    
    classLa = [[UILabel alloc] init];
    classLa.textColor = [UIColor blackColor];
    classLa.text = @"种植种类：";
    classLa.font = [UIFont systemFontOfSize:12];
    [view addSubview:classLa];
    
    button = [[UIButton alloc] init];
    button.backgroundColor = color(240, 116, 11, 1);
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"取消种植" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    view.frame = CGRectMake(0, 10, ScreenWidth, 120);
    imageV.frame = CGRectMake(10, 10, 100, 100);
    nameLa.frame = CGRectMake(120, 10, ScreenWidth-130, 20);
    classLa.frame = CGRectMake(120, 30, 60, 15);
    button.frame = CGRectMake(ScreenWidth-90, 90, 80, 20);
}

- (void)button {
    
}

@end
