//
//  CCArenaNavigationViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCArenaNavigationViewController.h"

@interface CCArenaNavigationViewController ()

@end

@implementation CCArenaNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //修改导航栏背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
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
