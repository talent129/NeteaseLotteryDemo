//
//  CCBottomBar.h
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCBottomBar;

@protocol CCBottomBarDelegate <NSObject>

- (void)bottomBarView:(CCBottomBar *)bottomBarView didClickBottomBarBtnWithIndex:(NSInteger)index;

@end

@interface CCBottomBar : UIView

- (void)addBottomBarWithImage:(NSString *)normalName withSelected:(NSString *)selectedName;

@property (nonatomic, weak) id<CCBottomBarDelegate>delegate;

@end
