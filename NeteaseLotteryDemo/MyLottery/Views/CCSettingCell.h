//
//  CCSettingCell.h
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCSettingCell : UITableViewCell

+ (instancetype)settingCellWithTableView:(UITableView *)tableView;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView item:(NSDictionary *)item;

@property (nonatomic, strong) NSDictionary *item;

- (void)setTimeWithText:(NSString *)text;

@end
