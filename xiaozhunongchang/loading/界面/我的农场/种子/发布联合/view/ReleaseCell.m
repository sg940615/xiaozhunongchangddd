//
//  ReleaseCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ReleaseCell.h"
#import "Defines.h"

@interface ReleaseCell ()
{
    UIView *view;
    UILabel *price;
    UIButton *button;
}
@end
@implementation ReleaseCell
@synthesize imageV,nameLa,priceLa,timeLa,detailsLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.backgroundColor = color(249, 247, 247, 1);
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
    nameLa.textColor = [UIColor blackColor];
    nameLa.font = [UIFont systemFontOfSize:13];
    [view addSubview:nameLa];
    
    detailsLa = [[UILabel alloc] init];
    detailsLa.textColor = detailsColor;
    detailsLa.numberOfLines = 0;
    detailsLa.font = [UIFont systemFontOfSize:10];
    [view addSubview:detailsLa];
    
    timeLa = [[UILabel alloc] init];
    timeLa.textColor = detailsColor;
    timeLa.font = [UIFont systemFontOfSize:10];
    [view addSubview:timeLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.textColor = color(228, 96, 38, 1);
    priceLa.font = [UIFont systemFontOfSize:10];
    [view addSubview:priceLa];
    
    price = [[UILabel alloc] init];
    price.text = @"联合价格：";
    price.textColor = detailsColor;
    price.font = [UIFont systemFontOfSize:10];
    [view addSubview:price];
    
    button = [[UIButton alloc] init];
    button.backgroundColor = color(240, 116, 11, 1);
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    [button setTitle:@"选择种植" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    view.frame = CGRectMake(0, 10, ScreenWidth, 100);
    imageV.frame = CGRectMake(20, 10, 80, 80);
    nameLa.frame = CGRectMake(120, 10, 60, 20);
    timeLa.frame = CGRectMake(120, 30, ScreenWidth-140, 15);
    priceLa.frame = CGRectMake(170, 75, 80, 15);
    price.frame = CGRectMake(120, 75, 50, 15);
    button.frame = CGRectMake(ScreenWidth-90, 10, 80, 20);
}

- (void)button {
    
}

@end
