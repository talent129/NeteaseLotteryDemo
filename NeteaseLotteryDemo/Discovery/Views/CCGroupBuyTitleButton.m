//
//  CCGroupBuyTitleButton.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCGroupBuyTitleButton.h"
#import "UIView+CCExt.h"

@implementation CCGroupBuyTitleButton

////设置按钮中titleLabel的frame
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//
//}
//
////设置按钮中图片的frame
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /***************修改titleLabel的frame***************/
    //    //获取titleLabel的frame
    //    CGRect titleLabelFrame = self.titleLabel.frame;
    //
    //    //修改titleLabel的frame x为0
    //    titleLabelFrame.origin.x = 0;
    //
    //    //重新赋值
    //    self.titleLabel.frame = titleLabelFrame;
    self.titleLabel.x = 0;
    
    /***************修改图片框的frame***************/
    //    CGRect imageFrame = self.imageView.frame;
    //
    //    imageFrame.origin.x = titleLabelFrame.size.width;
    //
    //    self.imageView.frame = imageFrame;
    self.imageView.x = self.titleLabel.w;
    
    //格式化代码: Xcode -> Preferences -> Key Bindings -> Re-Indent 可修改快捷键
}

@end
