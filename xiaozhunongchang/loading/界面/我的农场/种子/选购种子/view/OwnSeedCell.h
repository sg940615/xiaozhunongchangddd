//
//  OwnSeedCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Seeddelegate <NSObject>

- (void)nextSeedDetails;

@end

@interface OwnSeedCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *timeLa;
@property (nonatomic,strong) UILabel *detailsLa;
@property (nonatomic,strong) UILabel *priceLa;

@property (nonatomic,assign) id <Seeddelegate> Seeddelegate;

@end
