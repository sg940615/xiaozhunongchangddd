//
//  JointFarmCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/18.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JointDelegate <NSObject>

- (void)nextJoint;

@end

@interface JointFarmCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *classLa;
@property (nonatomic,strong) UILabel *timeLa;
@property (nonatomic,strong) UILabel *friendLa;

@property (nonatomic,assign) id <JointDelegate> JointDelegate;

+(NSString *)friend:(NSInteger)number;
@end
