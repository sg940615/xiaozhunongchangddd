//
//  ActivityCollectionViewCell.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/19.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ActivityCollectionViewCell.h"

@implementation ActivityCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 90)];
    [self addSubview:_imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(5, 90, self.bounds.size.width - 10, 55)];
    _label.font = [UIFont systemFontOfSize:12];
    _label.numberOfLines = 2;
    [self addSubview:_label];
}

@end
