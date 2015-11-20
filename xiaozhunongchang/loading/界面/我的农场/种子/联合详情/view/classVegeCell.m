//
//  classVegeCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "classVegeCell.h"
#import "Defines.h"

@interface classVegeCell ()
{
    UILabel *lineLa;
    UIButton *button;
}
@end
@implementation classVegeCell
@synthesize nameLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.backgroundColor = color(249, 249, 249, 1);
    }
    return self;
}

- (void)setup {
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:nameLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(241, 241, 241, 1);
    [self.contentView addSubview:lineLa];
    
    button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.backgroundColor = color(240, 116, 11, 1);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"种植" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    nameLa.frame = CGRectMake(15, 0, ScreenWidth-200, 30);
    button.frame = CGRectMake(ScreenWidth-160, 5, 50, 20);
    lineLa.frame = CGRectMake(0, 29, ScreenWidth-100, 1);
}

- (void)button {
    
}

@end
