//
//  OrderCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "QROrderCell.h"
#import "Defines.h"

@interface QROrderCell ()
{
    UIView *view;
}
@end
@implementation QROrderCell
@synthesize imageV,nameLa,priceLa,numLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        self.backgroundColor = color(242, 242, 242, 1);
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
    nameLa.font = [UIFont systemFontOfSize:13];
    [view addSubview:nameLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.textAlignment = NSTextAlignmentRight;
    priceLa.textColor = priceLaColor;
    priceLa.font = [UIFont systemFontOfSize:13];
    [view addSubview:priceLa];

    numLa = [[UILabel alloc] init];
    numLa.textAlignment = NSTextAlignmentRight;
    numLa.textColor = detailsColor;
    numLa.font = [UIFont systemFontOfSize:13];
    [view addSubview:numLa];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    view.frame = CGRectMake(0, 10, ScreenWidth, 100);
    imageV.frame = CGRectMake(10, 10, 60, 60);
    nameLa.frame = CGRectMake(80, 10, 80, 20);
    priceLa.frame = CGRectMake(ScreenWidth-110, 10, 100, 20);
    numLa.frame = CGRectMake(ScreenWidth-110, 30, 100, 20);
}

@end
