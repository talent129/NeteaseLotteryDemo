//
//  CCLoginViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCLoginViewController.h"
#import "CCSettingsViewController.h"
#import "CCQuestionViewController.h"

@interface CCLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation CCLoginViewController

//点击设置按钮事件
- (IBAction)settingBtn:(UIBarButtonItem *)sender {
    
    CCSettingsViewController *settingVC = [[CCSettingsViewController alloc] init];
    
    //标题
    settingVC.navigationItem.title = @"设置";
    
    //右侧 常见问题 按钮    --> 在这里设置右侧按钮等 防止重用settingVC时 不需要这个按钮
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBarButtonItem)];
//    settingVC.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 60, 44);
    [rightBtn setTitle:@"常见问题" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(didClickBarButtonItem) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    settingVC.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //指定一个plist文件名
    settingVC.plistName = @"CCSettingIndex.plist";
    
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)didClickBarButtonItem
{
    CCQuestionViewController *ques = [[CCQuestionViewController alloc] init];
    
    ques.navigationItem.title = @"常见问题";
    [self.navigationController pushViewController:ques animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载按钮背景图片
    UIImage *normal = [UIImage imageNamed:@"bottomRedButton"];
    UIImage *highlighted = [UIImage imageNamed:@"botton_red"];
    
    //设置图片的拉伸方式
    normal = [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.5];
    highlighted = [highlighted stretchableImageWithLeftCapWidth:highlighted.size.width * 0.5 topCapHeight:highlighted.size.height * 0.5];
    
    //把图片设置给按钮
    [self.loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:highlighted forState:UIControlStateHighlighted];
    
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
