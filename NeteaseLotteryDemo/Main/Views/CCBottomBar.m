//
//  CCBottomBar.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCBottomBar.h"
#import "CCBottomBarBtn.h"

@interface CCBottomBar ()

//类型
//@property (nonatomic, strong) NSArray *types;

//保存底部5个button
//@property (nonatomic, strong) NSArray *buttons;

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation CCBottomBar

//实现一个添加底部bottom bar button的方法
- (void)addBottomBarWithImage:(NSString *)normalName withSelected:(NSString *)selectedName
{
    //创建按钮
    CCBottomBarBtn *btn = [CCBottomBarBtn buttonWithType:UIButtonTypeCustom];
    
    //设置按钮的背景图片
    [btn setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    
    //指定点击事件
    [btn addTarget:self action:@selector(didClickBottomBarBtn:) forControlEvents:UIControlEventTouchDown];//UIControlEventTouchUpInside-->手指抬起触发
    
    //把按钮添加到底部
    [self addSubview:btn];
}

//底部按钮点击事件
- (void)didClickBottomBarBtn:(UIButton *)btn
{
    //点击某个按钮 当前被点击的按钮的selected变为YES
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    //获取当前点击索引
    NSInteger index = (NSInteger)btn.tag;
    
    //根据当前点击按钮索引  切换tabBar 控制器
    if ([self.delegate respondsToSelector:@selector(bottomBarView:didClickBottomBarBtnWithIndex:)]) {
        [self.delegate bottomBarView:self didClickBottomBarBtnWithIndex:index];
    }
}

#pragma mark -
//- (NSArray *)types
//{
//    if (!_types) {
//        _types = @[@"LotteryHall", @"Arena", @"Discovery", @"History", @"MyLottery"];
//    }
//    return _types;
//}

//- (NSArray *)buttons
//{
//    if (!_buttons) {
//        
//        NSMutableArray *mArr = [NSMutableArray array];
//        
//        for (int i = 0; i < 5; i ++) {
//            
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            
//            NSString *normalName = [NSString stringWithFormat:@"TabBar_%@", self.types[i]];
//            NSString *selectedName = [NSString stringWithFormat:@"TabBar_%@_selected", self.types[i]];
//            
//            //设置按钮的背景图片
//            [btn setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
//            [btn setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
//            
//            //把按钮添加到底部
//            [self addSubview:btn];
//            
//            [mArr addObject:btn];
//        }
//        _buttons = mArr;
//    }
//    return _buttons;
//}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    CGFloat w = self.bounds.size.width / 5.0;
//    CGFloat h = self.bounds.size.height;
//    CGFloat y = 0;
//    
//    for (int i = 0; i < self.buttons.count; i ++) {
//        CGFloat x = i * w;
//        UIButton *btn = self.buttons[i];
//        btn.frame = CGRectMake(x, y, w, h);
//    }
//    
//}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat w = self.bounds.size.width / self.subviews.count;
    CGFloat h = self.bounds.size.height;
    CGFloat y = 0;

    for (int i = 0; i < self.subviews.count; i ++) {
        CGFloat x = i * w;
        UIButton *btn = self.subviews[i];
        
        //为每个按钮设置tab值
        btn.tag = i;
        
        btn.frame = CGRectMake(x, y, w, h);
        
         //默认选中第一个
        if (i == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
    }

}

@end
