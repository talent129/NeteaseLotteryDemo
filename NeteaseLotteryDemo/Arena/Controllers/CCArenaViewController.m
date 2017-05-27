//
//  CCArenaViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCArenaViewController.h"

@interface CCArenaViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@end

@implementation CCArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置控制器的背景图片
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    //设置UISegmentedControl的背景图片
    UIImage *normal = [UIImage imageNamed:@"ArenaHall_SegNormalBG"];
    UIImage *selected = [UIImage imageNamed:@"ArenaHall_SegSelectBG"];
    
    //默认情况下
    [self.segControl setBackgroundImage:normal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //选中情况下
    [self.segControl setBackgroundImage:selected forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置文字颜色
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
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
