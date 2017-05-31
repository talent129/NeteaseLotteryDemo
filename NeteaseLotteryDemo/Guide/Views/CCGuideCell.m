//
//  CCGuideCell.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCGuideCell.h"
#import "CCMainTabBarController.h"

@interface CCGuideCell ()

@property (nonatomic, strong) UIImageView *imgBGView;

//启动按钮
@property (nonatomic, strong) UIButton *startBtn;

@end

@implementation CCGuideCell

- (void)setCellCount:(NSInteger)count currentCellCount:(NSInteger)idx
{
    if (idx == count - 1) {
        self.startBtn.hidden = NO;
    }else {
        self.startBtn.hidden = YES;
    }
}

//重写set方法
- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imgBGView.image = image;
}

#pragma mark -
- (UIImageView *)imgBGView
{
    if (!_imgBGView) {
        _imgBGView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgBGView];
    }
    return _imgBGView;
}

- (UIButton *)startBtn
{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(startBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_startBtn];
    }
    return _startBtn;
}

- (void)startBtnAction
{
    //创建主控制器
    CCMainTabBarController *mainVC = [[CCMainTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imgBGView.frame = self.bounds;
    
    //按钮大小
    self.startBtn.frame = CGRectMake((self.bounds.size.width - 160) * 0.5, self.bounds.size.height * 0.9, 160, 40);
}

@end
