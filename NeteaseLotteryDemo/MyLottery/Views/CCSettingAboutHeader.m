//
//  CCSettingAboutHeader.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCSettingAboutHeader.h"

@implementation CCSettingAboutHeader

+ (instancetype)settingAboutHeader
{
    //加载xib
    CCSettingAboutHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CCSettingAboutHeader" owner:nil options:nil] lastObject];
    return headerView;
}

@end
