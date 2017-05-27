//
//  CCProduct.h
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCProduct : NSObject

/*
 {
 "title" : "邮箱大师",
 "stitle" : "网易推出的通用邮箱APP",
 "id" : "",
 "url" : "",
 "icon" : "mail",
 "customUrl" : "",
 },
 */

@property (nonatomic, copy) NSString *title;//" : "邮箱大师",
@property (nonatomic, copy) NSString *stitle;//" : "网易推出的通用邮箱APP",
@property (nonatomic, copy) NSString *ID;//" : "",
@property (nonatomic, copy) NSString *url;//" : "",
@property (nonatomic, copy) NSString *icon;//" : "mail",
@property (nonatomic, copy) NSString *customUrl;//" : "",

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
