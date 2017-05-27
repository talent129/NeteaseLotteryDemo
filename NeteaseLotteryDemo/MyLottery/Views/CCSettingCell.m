//
//  CCSettingCell.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCSettingCell.h"

@implementation CCSettingCell

- (void)setTimeWithText:(NSString *)text
{
    self.detailTextLabel.text = text;
    
    //把时间存储到偏好设置中
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    [userDe setObject:text forKey:self.item[@"key_Name_time"]];
    [userDe synchronize];
}

+ (UITableViewCellStyle)cellStyleWithText:(NSString *)cellStyle
{
    if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    }else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    }else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }else {
        return UITableViewCellStyleDefault;
    }
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView item:(NSDictionary *)item
{
    static NSString *iden = @"setting_cell";
    CCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[CCSettingCell alloc] initWithStyle:[self cellStyleWithText:item[@"cell_type"]] reuseIdentifier:iden];
        
        //点击效果
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //字体颜色
        if (item[@"is_highlighted"]) {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
    }
    
    return cell;
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    static NSString *iden = @"setting_cell";
    CCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[CCSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
        //点击效果
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}

//重写set方法
- (void)setItem:(NSDictionary *)item
{
    _item = item;
    
    //把数据给cell
    if (item[@"icon"]) {
        self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    }
    self.textLabel.text = item[@"title"];
    
    
    self.detailTextLabel.text = item[@"detailTitle"];
    
    if (self.item[@"key_Name_time"] && [self.item[@"key_Name_time"] length] > 0) {
        
        //从保存时间的key_Name_time中获取偏好设置中的时间
        NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
        NSString *timeStr = [userD objectForKey:self.item[@"key_Name_time"]];
        if (timeStr.length > 0) {
            self.detailTextLabel.text = timeStr;
        }
    }
    
    //设置accessory
    if (item[@"accessory"] && [item[@"accessory"] length]) {
        //根据配置来生成一个类(将一个字符串转换成一个类)
        Class AccessoryClass = NSClassFromString(item[@"accessory"]);
        
        //根据类创建对象
        id accessory_obj = [[AccessoryClass alloc] init];
        
        //判断类型
        if ([accessory_obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imgView = (UIImageView *)accessory_obj;
            imgView.image = [UIImage imageNamed:item[@"accessory_image"]];
            
            //设置图片框的大小为实际大小
            [imgView sizeToFit];
        }else if ([accessory_obj isKindOfClass:[UISwitch class]]) {
            //如果是开关
            UISwitch *switcher = (UISwitch *)accessory_obj;
            [switcher addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            
            //从偏好设置中获取数据并设置给当前开关
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            
            switcher.on = [userDefault boolForKey:self.item[@"key_Name"]];
        }
        
        
        
        
        //把accessory_obj 设置给cell的accessory
        self.accessoryView = accessory_obj;
    }
}

//开关改变事件
- (void)switchChanged:(UISwitch *)switcher
{
    //获取偏好设置对象
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    //写入
    [userDefault setBool:switcher.isOn forKey:self.item[@"key_Name"]];
    
    //同步
    [userDefault synchronize];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
