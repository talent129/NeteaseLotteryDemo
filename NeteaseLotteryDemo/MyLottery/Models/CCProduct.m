//
//  CCProduct.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCProduct.h"

@implementation CCProduct

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.customUrl = dict[@"customUrl"];
        self.icon = dict[@"icon"];
        self.stitle = dict[@"stitle"];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
