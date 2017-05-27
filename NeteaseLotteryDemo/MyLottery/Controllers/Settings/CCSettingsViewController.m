//
//  CCSettingsViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCSettingsViewController.h"
#import "CCSettingCell.h"

@interface CCSettingsViewController ()

@property (nonatomic, strong) NSArray *groups;

@end

@implementation CCSettingsViewController

//重写init方法 保证创建的tableView控制器中 创建的tableView 都是group样式
- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

//重写init方法 保证创建的tableView控制器中 创建的tableView 都是group样式
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark -
- (NSArray *)groups
{
    if (!_groups) {
        
        //懒加载plist文件中内容
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName ofType:nil];
        _groups = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //设置左侧返回按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navbar_backbutton"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = item;
    
}

//使用自定义返回按钮图片 自己实现返回效果
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //找到对应的组
    NSDictionary *group = self.groups[section];
    
    //找到组中的items集合
    NSArray *items = group[@"items"];
    
    //返回子项的个数
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取数据
    //获取组信息
    NSDictionary *group = self.groups[indexPath.section];
    
    //获取具体的项的信息
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    
    //创建cell
//    CCSettingCell *cell = [CCSettingCell settingCellWithTableView:tableView];
    CCSettingCell *cell = [CCSettingCell settingCellWithTableView:tableView item:item];
    
    cell.item = item;
    
    //返回cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---点击了第%ld组, 第%ld行", indexPath.section, indexPath.row);
    
    //动画变为非选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //获取当前选中数据
    //获取组信息
    NSDictionary *group = self.groups[indexPath.section];
    
    //获取具体的项的信息
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    
    //获取当前点击的项的targetVC
    NSString *target = item[@"targetVC"];
    
    if (target) {
        Class Target = NSClassFromString(target);
        
        //创建目标控制器的对象
        UIViewController *destinationVC = [[Target alloc] init];
        
        //如果目标控制器是 设置控制器 那么指定一个plistName
        if ([destinationVC isKindOfClass:[CCSettingsViewController class]]) {
            CCSettingsViewController *settingVC = (CCSettingsViewController *)destinationVC;
            settingVC.plistName = item[@"plist_Name"];
            
            //设置控制器标题
            settingVC.navigationItem.title = item[@"title"];
        }
        destinationVC.navigationItem.title = item[@"title"];
        
        //把目标控制器push到当前导航控制器中
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    //判断是否有function_Name这个键
    if ([item[@"function_Name"] length] > 0) {
        //表示有对应的函数执行
        //把方法名转成一个selector
        SEL func = NSSelectorFromString(item[@"function_Name"]);
        
        //执行这个方法
        if ([self respondsToSelector:func]) {
            [self performSelector:func];
        }
    }
    
}

//检查更新
- (void)checkUpdate
{
    NSLog(@"checkUpdate");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"检查更新..." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ac];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //获取组信息
    NSDictionary *group = self.groups[section];
    
    return group[@"header"];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //获取组信息
    NSDictionary *group = self.groups[section];
    
    return group[@"footer"];
}

@end
