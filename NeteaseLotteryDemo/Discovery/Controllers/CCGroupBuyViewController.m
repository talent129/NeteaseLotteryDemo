//
//  CCGroupBuyViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/26.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCGroupBuyViewController.h"
#import "UIView+CCExt.h"

#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

@interface CCGroupBuyViewController ()

@property (nonatomic, strong) UIView *displayView;

@end

@implementation CCGroupBuyViewController

#pragma mark -
- (UIView *)displayView
{
    if (!_displayView) {
        _displayView = [[UIView alloc] init];
        _displayView.backgroundColor = [UIColor cyanColor];
        CGFloat h = 0;
        CGFloat x = 0;
        CGFloat y = 20 + 44;
        _displayView.frame = CGRectMake(x, y, SCREEN_Width, h);
        [self.view addSubview:_displayView];
    }
    return _displayView;
}

//标题按钮的点击事件
- (IBAction)didClickBtn:(UIButton *)sender {
    
    //先加载一次  否则第一次显示不正确
    [self displayView];
    
    //三角旋转
    [UIView animateWithDuration:0.3 animations:^{
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
        
        //显示或隐藏view
        if (self.displayView.h == 0) {
            self.displayView.h = 200;
        }else {
            self.displayView.h = 0;
        }
        
    } completion:^(BOOL finished) {
        //
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
