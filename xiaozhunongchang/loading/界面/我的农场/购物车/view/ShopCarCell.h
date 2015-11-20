//
//  ShopCarCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Countdelegate <NSObject>

- (UITableViewCell *)Count;

@end

@interface ShopCarCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *priceLa;
@property (nonatomic,strong) UILabel *toatlLa;
@property (nonatomic,assign) NSInteger count;

@property (nonatomic,assign) id <Countdelegate> Countdelegate;

@end
