//
//  UIView+CCExt.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "UIView+CCExt.h"

@implementation UIView (CCExt)

//x get
- (CGFloat)x
{
    return self.frame.origin.x;
}

//x set
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

//y get
- (CGFloat)y
{
    return self.frame.origin.y;
}

//y set
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

//w get
- (CGFloat)w
{
    return self.frame.size.width;
}

//w set
- (void)setW:(CGFloat)w
{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

//h get
- (CGFloat)h
{
    return self.frame.size.height;
}

//h set
- (void)setH:(CGFloat)h
{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

@end
