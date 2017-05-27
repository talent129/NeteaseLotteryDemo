//
//  CCHallTableViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCHallTableViewController.h"

@interface CCHallTableViewController ()

@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UIImageView *imgView;

@end

@implementation CCHallTableViewController

- (IBAction)activityBtnClick:(UIButton *)sender {
    
    //创建一个遮盖 将整个界面遮盖
    UIView *coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    //不建议这样做
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow addSubview:coverView];
    
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    
    //创建一个图片框 添加到遮盖上   initWithImage: 此方法frame为图片实际大小 -->这里随便放了一张图片
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert_bigSmall_joySquare"]];
    
    //允许交互
    imgView.userInteractionEnabled = YES;
    imgView.center = coverView.center;
    [self.tabBarController.view addSubview:imgView];
    self.imgView = imgView;
    
    //图片框上创建一个关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(imgView.frame.size.width - 25, 5, 20, 20);
    [closeBtn setImage:[UIImage imageNamed:@"Activity_close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:closeBtn];
    
}

- (void)closeBtnAction
{
    //动画效果
    [UIView animateWithDuration:0.3 animations:^{
        self.coverView.alpha = 0;
        self.imgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.imgView removeFromSuperview];
        [self.coverView removeFromSuperview];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //initWithImage: frame根据图片实际大小
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hall_title_logo"]];
    [self.navigationItem setTitleView:imgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
