//
//  CCAboutViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCAboutViewController.h"
#import "CCSettingAboutHeader.h"

@interface CCAboutViewController ()

@end

@implementation CCAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载xib
//    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CCSettingAboutHeader" owner:nil options:nil] lastObject];
    
    CCSettingAboutHeader *headerView = [CCSettingAboutHeader settingAboutHeader];
    
    self.tableView.tableHeaderView = headerView;
    
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
