//
//  ShopCarCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ShopCarCell.h"
#import "Defines.h"

@interface ShopCarCell ()
{
    UIView *view;
    UILabel *number;
    UIButton *selsetBT;
    UIView *numeberV;
    UIButton *numBT;
    NSString *numStr;

}
@end

@implementation ShopCarCell
@synthesize imageV,nameLa,priceLa,toatlLa,count;

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
    nameLa.textColor = [UIColor blackColor];
    [view addSubview:nameLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.font = [UIFont systemFontOfSize:13];
    priceLa.textColor = [UIColor blackColor];
    [view addSubview:priceLa];
    
    toatlLa = [[UILabel alloc] init];
    toatlLa.textAlignment = NSTextAlignmentRight;
    toatlLa.font = [UIFont systemFontOfSize:11];
    toatlLa.textColor = priceLaColor;
    [view addSubview:toatlLa];
    
    number = [[UILabel alloc] init];
    number.text = @"数量：";
    number.font = [UIFont systemFontOfSize:11];
    number.textColor = [UIColor blackColor];
    [view addSubview:number];
    
    selsetBT = [[UIButton alloc] init];
    [selsetBT setImage:[UIImage imageNamed:@"购物车_06"] forState:UIControlStateNormal];
    [selsetBT setImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
    [selsetBT addTarget:self action:@selector(selsetBT:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:selsetBT];
    
    numeberV = [[UIView alloc] init];
    numeberV.backgroundColor = [UIColor grayColor];
    [view addSubview:numeberV];
    
    count = 2;
    numStr = [NSString stringWithFormat:@"%ld",count];
    NSArray *array = [[NSArray alloc] initWithObjects:@"-",numStr,@"+", nil];
    
    for (int i=0; i<3; i++) {
        numBT = [[UIButton alloc] initWithFrame:CGRectMake(1+i*23, 1, 22, 14)];
        numBT.backgroundColor = [UIColor whiteColor];
        numBT.titleLabel.font = [UIFont systemFontOfSize:12];
        numBT.tag = 1000+i;
        [numBT setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [numBT setTitle:array[i] forState:UIControlStateNormal];
        [numBT addTarget:self action:@selector(numBT:) forControlEvents:UIControlEventTouchUpInside];
        [numeberV addSubview:numBT];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    view.frame = CGRectMake(0, 0, ScreenWidth, 80);
    imageV.frame = CGRectMake(60, 10, 60, 60);
    nameLa.frame = CGRectMake(130, 10, 80, 20);
    priceLa.frame = CGRectMake(130, 50, ScreenWidth-140, 20);
    toatlLa.frame = CGRectMake(ScreenWidth-110, 10, 100, 20);
    selsetBT.frame = CGRectMake(20, 30, 20, 20);
    number.frame = CGRectMake(130, 30, 33, 20);
    numeberV.frame = CGRectMake(163, 32, 70, 16);
}

- (void)selsetBT:(UIButton *)button {
    if (button.selected) {
        selsetBT.selected = NO;
    }else {
        selsetBT.selected = YES;
    }
}

- (void)numBT:(UIButton *)button {
    
    UIButton *but = [self viewWithTag:1001];
    
    if (button.tag == 1000) {
        
        if (count>0 ) {
            count--;
            [but setTitle:[NSString stringWithFormat:@"%ld",count] forState:UIControlStateNormal];
            [self.Countdelegate Count];
        }
        
    }else if (button.tag == 1002) {
        
        count++;
        [but setTitle:[NSString stringWithFormat:@"%ld",count] forState:UIControlStateNormal];
        [self.Countdelegate Count];
    }
}

@end
