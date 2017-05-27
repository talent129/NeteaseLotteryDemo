//
//  CCGuideCell.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCGuideCell.h"

@interface CCGuideCell ()

@property (nonatomic, strong) UIImageView *imgBGView;

@end

@implementation CCGuideCell

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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imgBGView.frame = self.bounds;
}

@end
