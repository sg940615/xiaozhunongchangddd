//
//  ActivityViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityCollectionViewCell.h"

@interface ActivityViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *AllCollectionView;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"活动区";
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view from its nib.
    [self createButton];
    [self createCollectionView];
}

- (void)createButton {
    NSArray *btnNameArr = @[@"全部",@"最新活动",@"即将结束",@"已结束"];
    for (int i = 0; i < btnNameArr.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + ScreenWidth/4 *i, 0, ScreenWidth/4 - 1, 30);
        [button setTitle:btnNameArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [self addFenGeXian:button andRect:CGRectMake(0, 29, ScreenWidth/4, 1)];
    }
}

- (void)buttonClicked:(UIButton *)button {
    
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _AllCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight - 94) collectionViewLayout:layout];
    _AllCollectionView.delegate = self;
    _AllCollectionView.dataSource = self;
    [self.view addSubview:_AllCollectionView];
    [_AllCollectionView registerClass:[ActivityCollectionViewCell class] forCellWithReuseIdentifier:@"a"];
    _AllCollectionView.backgroundColor = [UIColor clearColor];
    _AllCollectionView.showsVerticalScrollIndicator = NO;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:indexPath];
    [self setBorder:cell size:1];
    cell.imageView.image = [UIImage imageNamed:@"two2.jpg"];
    cell.label.text = @"陆安小镇 六重好礼送不停";
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //第一个参数是宽，第二个参数是高
    return CGSizeMake(145, 145);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上左下右
    return UIEdgeInsetsMake(5, 10, 5, 10);
}


@end
