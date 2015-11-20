//
//  OwnSeedCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "OwnSeedCell.h"
#import "Defines.h"

@interface OwnSeedCell ()
{
    UILabel *lineLa;
    UILabel *numLa;
    UIButton *buyBT;
    UIButton *shopCarBT;
}
@end


@implementation OwnSeedCell
@synthesize imageV,nameLa,timeLa,detailsLa,priceLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        
    }
    return self;
}

- (void)setup {
    
    imageV = [[UIImageView alloc] init];
    imageV.userInteractionEnabled = YES;
    [self.contentView addSubview:imageV];
    
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap)];
    [imageV addGestureRecognizer:imgTap];
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:13];
    nameLa.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLa];
    
    
    timeLa = [[UILabel alloc] init];
    timeLa.font = [UIFont systemFontOfSize:10];
    timeLa.textColor = detailsColor;
    [self.contentView addSubview:timeLa];
    
    detailsLa = [[UILabel alloc] init];
    detailsLa.font = [UIFont systemFontOfSize:10];
    detailsLa.textColor = detailsColor;
    detailsLa.numberOfLines = 0;
    [self.contentView addSubview:detailsLa];
    
    numLa = [[UILabel alloc] init];
    numLa.font = [UIFont systemFontOfSize:10];
    numLa.text = @"数量：";
    numLa.textColor = detailsColor;
    [self.contentView addSubview:numLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.font = [UIFont systemFontOfSize:11];
    priceLa.textAlignment = NSTextAlignmentRight;
    priceLa.textColor = priceLaColor;
    [self.contentView addSubview:priceLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = lineLaColor;
    [self.contentView addSubview:lineLa];
    
    buyBT = [[UIButton alloc] init];
    [buyBT setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBT.backgroundColor = ZCnongzhuang;
    buyBT.titleLabel.font = [UIFont systemFontOfSize:12];
    [buyBT addTarget:self action:@selector(buyBT) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:buyBT];
    
    shopCarBT = [[UIButton alloc] init];
    [shopCarBT setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCarBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shopCarBT.backgroundColor = color(226, 88, 29, 1);
    shopCarBT.titleLabel.font = [UIFont systemFontOfSize:12];
    [shopCarBT addTarget:self action:@selector(shopCarBT) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:shopCarBT];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    imageV.frame = CGRectMake(10, 10, 100, 100);
    nameLa.frame = CGRectMake(118, 10, ScreenWidth-138, 20);
    timeLa.frame = CGRectMake(118, 30, ScreenWidth-138, 15);
    numLa.frame = CGRectMake(118, 73, 30, 15);
    priceLa.frame = CGRectMake(208, 73, 80, 15);
    buyBT.frame = CGRectMake(118, 90, 80, 20);
    shopCarBT.frame = CGRectMake(208, 90, 80, 20);
    lineLa.frame = CGRectMake(0, 119, ScreenWidth, 1);
    
    
}

- (void)imageTap {
    [self.Seeddelegate nextSeedDetails];
}

- (void)buyBT {
    
}

- (void)shopCarBT {
    
}

@end
