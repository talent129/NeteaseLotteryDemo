//
//  CCProductCell.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCProductCell.h"
#import "CCProduct.h"

@interface CCProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CCProductCell

//重写set方法
- (void)setProduct:(CCProduct *)product
{
    _product = product;
    self.titleLabel.text = product.title;
    self.iconImgView.image = [UIImage imageNamed:product.icon];
}

@end
