//
//  CCScorePushViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCScorePushViewController.h"
#import "UIView+CCExt.h"
#import "CCSettingCell.h"

@interface CCScorePushViewController ()

//懒加载datePicker
@property (nonatomic, strong) UIDatePicker *datePicker;

//懒加载工具栏
@property (nonatomic, strong) UIToolbar *toolBar;

//懒加载textField
@property (nonatomic, strong) UITextField *textField;

//记录选中的cell
@property (nonatomic, strong) NSIndexPath *selectIndexPath;

@end

@implementation CCScorePushViewController

#pragma mark -
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.inputView = self.datePicker;
        _textField.inputAccessoryView = self.toolBar;
    }
    return _textField;
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    return _datePicker;
}

- (UIToolbar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc] init];
        _toolBar.h = 44;
        _toolBar.barTintColor = [UIColor purpleColor];
        
        //创建工具栏中的三个按钮
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleAction)];
        
        //
        UIBarButtonItem *spring = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        //确定
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmAction)];
        
        _toolBar.items = @[cancel, spring, confirm];
        
    }
    return _toolBar;
}

- (void)cancleAction
{
    [self.view endEditing:YES];
    
    [self.textField removeFromSuperview];
}

- (void)confirmAction
{
    [self.view endEditing:YES];
    
    //把用户选择的时间设置给detailTextLabel
    //获取用户选择的时间
    NSDate *date = self.datePicker.date;
    
    //把用户选择的时间转换成字符串
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"HH:mm";
    NSString *dateStr = [format stringFromDate:date];
    
    //把时间设置给当前选中的cell的detail
    //获取当前选中的cell
    CCSettingCell *cell = [self.tableView cellForRowAtIndexPath:self.selectIndexPath];
//    cell.detailTextLabel.text = dateStr;
    
    //封装 不给控制器暴露太多属性
    [cell setTimeWithText:dateStr];
    
    [self.textField removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //记录选中的cell
    self.selectIndexPath = indexPath;
    
    //
    if (indexPath.section == 0) {
        return;
    }
    
    //创建文本框 并且将文本框添加到当前的cell中  同时让当前文本框变成第一响应者
    CCSettingCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView addSubview:self.textField];
    [self.textField becomeFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
