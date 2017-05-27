//
//  CCMoreProductController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCMoreProductController.h"
#import "CCProduct.h"
#import "CCProductCell.h"

@interface CCMoreProductController ()

//所有产品信息
@property (nonatomic, strong) NSArray *productArray;

@end

@implementation CCMoreProductController

static NSString * const iden = @"product_cell";

- (NSArray *)productArray
{
    if (!_productArray) {
        
        //获取json文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_product.json" ofType:nil];
        
        //根据给定的path 加载对应的json文件到NSData
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        
        //
        NSError *error;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error != nil) {
            NSLog(@"出错");
        }
        
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            CCProduct *product = [CCProduct productWithDict:dic];
            [mArr addObject:product];
        }
        
        _productArray = mArr;
        
    }
    return _productArray;
}

- (instancetype)init
{
    //创建一个布局对象(流水布局)
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //每个格子的大小
    flowLayout.itemSize = CGSizeMake(80, 80);
    
    //修改格子与格子之间的水平间距(最小水平间距)
    flowLayout.minimumInteritemSpacing = 0;
    
    //垂直间距(最小垂直间距)
    flowLayout.minimumLineSpacing = 10;
    
    //设置组间距
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册cell 注册一个类
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:iden];
    
    //注册cell 注册一个xib
    UINib *nib = [UINib nibWithNibName:@"CCProductCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:iden];
    
    //设置背景图片
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
}

#pragma mark -collection view 数据源方法
//返回组的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回每一组有几个格子
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.productArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取数据
    CCProduct *product = self.productArray[indexPath.row];
    
    //创建cell
    CCProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    
    //把数据设置给cell
    cell.product = product;
    
    //返回cell
    return cell;
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取当前选中行的模型
    CCProduct *product = self.productArray[indexPath.row];
    
    NSLog(@"%@", product.title);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
