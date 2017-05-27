//
//  CCGuideController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCGuideController.h"
#import "CCGuideCell.h"

#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

@interface CCGuideController ()

@end

@implementation CCGuideController

static NSString * const reuseIdentifier = @"guide_cell";

//重写init方法
- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //一个cell大小为屏幕大小
    flowLayout.itemSize = CGSizeMake(SCREEN_Width, SCREEN_Height);
    
    //最小行间距
    flowLayout.minimumLineSpacing = 0;
    
    //水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册一个cell
    [self.collectionView registerClass:[CCGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //关闭弹簧效果
    self.collectionView.bounces = NO;
    
    //分页
    self.collectionView.pagingEnabled = YES;
    
    //滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

//代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //
    NSString *imgBg = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    UIImage *image = [UIImage imageNamed:imgBg];
    
    //创建cell
    CCGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    cell.image = image;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
