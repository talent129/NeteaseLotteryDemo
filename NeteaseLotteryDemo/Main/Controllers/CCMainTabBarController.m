//
//  CCMainTabBarController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/25.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCMainTabBarController.h"
#import "CCBottomBar.h"

@interface CCMainTabBarController ()<CCBottomBarDelegate>

//类型
@property (nonatomic, strong) NSArray *types;

@end

@implementation CCMainTabBarController

- (NSArray *)types
{
    if (!_types) {
        _types = @[@"LotteryHall", @"Arena", @"Discovery", @"History", @"MyLottery"];
    }
    return _types;
}

#pragma mark -CCBottomBarDelegate
- (void)bottomBarView:(CCBottomBar *)bottomBarView didClickBottomBarBtnWithIndex:(NSInteger)index
{
    //通过tab bar controller自己切换显示控制器
    self.selectedIndex = index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1. 加载子控制器
    [self loadChildViewControllers];
    
    //2. 加载自定义底部tabbar
    CCBottomBar *bottomBar = [[CCBottomBar alloc] init];
    
    //设置tab bar 背景颜色为黑色
    bottomBar.backgroundColor = [UIColor blackColor];
    
    //设置代理
    bottomBar.delegate = self;
    
    //通过循环 创建若干个底部tab bar item (根据子控制器数量创建)
    for (int i = 0; i < self.childViewControllers.count; i ++) {
        
        //拼接图片名称
        NSString *normalName = [NSString stringWithFormat:@"TabBar_%@", self.types[i]];
        NSString *selectedName = [NSString stringWithFormat:@"TabBar_%@_selected", self.types[i]];
        
        //调用bottom bar 内部的方法创建按钮
        [bottomBar addBottomBarWithImage:normalName withSelected:selectedName];
    }
    
    
    [self.tabBar addSubview:bottomBar];
    bottomBar.frame = self.tabBar.bounds;
}

//加载子控制器
- (void)loadChildViewControllers
{
    //加载storyboard文件中的导航控制器 并且将这些导航控制器添加到self中
    //1. 购彩大厅
    UINavigationController *navHall = [self navigationControllerWithStoryboardName:@"Hall"];
    
    //2. 竞技场
    UINavigationController *navArena = [self navigationControllerWithStoryboardName:@"Arena"];
    
    //3. 发现
    UINavigationController *navDiscovery = [self navigationControllerWithStoryboardName:@"Discovery"];
    
    //4. 开奖信息
    UINavigationController *navHistory = [self navigationControllerWithStoryboardName:@"History"];
    
    //5. 我的彩票
    UINavigationController *navMyLottery = [self navigationControllerWithStoryboardName:@"MyLottery"];
    
    //6. 添加到tab bar 控制器中
    self.viewControllers = @[navHall, navArena, navDiscovery, navHistory, navMyLottery];
}

//封装一个根据storyboard文件内创建控制器的方法
- (UINavigationController *)navigationControllerWithStoryboardName:(NSString *)storyboardName
{
    //加载storyboard文件
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    //创建storyboard中的初始化控制器
    return [storyboard instantiateInitialViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
