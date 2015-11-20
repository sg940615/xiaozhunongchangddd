//
//  selectSeedV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "selectSeedV.h"
#import "Defines.h"
#import "classVegeCell.h"
#import "ZZStringSize.h"

@implementation selectSeedV

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)setAction {
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 30)];
    label1.backgroundColor = ZCnongzhuang;
    label1.text = @" 请选择你要种植的种子以及种植方式";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:11];
    [self addSubview:label1];
    
    
    UIView *delegateV = [[UIView alloc] initWithFrame:CGRectMake(0, 130, ScreenWidth-100, 110)];
    delegateV.backgroundColor = color(249, 249, 249, 1);
    [self addSubview:delegateV];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 30)];
    label2.text = @"全权委托";
    label2.textColor = ZCnongzhuang;
    label2.font = [UIFont systemFontOfSize:14];
    [delegateV addSubview:label2];
    
    
    UILabel *labelText = [[UILabel alloc] init];
    labelText.text = @"你的种植过程全权由我们来完成，待作物收获过后，我们会根据你的选择进行处理。在种植的过程中，我们会以短信的方式提醒你我们将在何时对你的农场进行管理！最后我们将收取作物总价值的50%作为农场工人的劳务费和农场管理费。";
    labelText.textColor = [UIColor blackColor];
    labelText.numberOfLines =0;
    labelText.font = [UIFont systemFontOfSize:10];
    
    CGSize textCG = [ZZStringSize getSizeToString:labelText.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-125, 75) lineBreakMode:NSLineBreakByCharWrapping];
    labelText.frame = CGRectMake(15, 30, ScreenWidth-125, textCG.height);
    
    [delegateV addSubview:labelText];
    

    
}

@end
