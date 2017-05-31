//
//  AppDelegate.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/25.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "AppDelegate.h"
#import "CCMainTabBarController.h"
#import "CCGuideController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self chooseStartController];
    
    //创建UITabBarController
//    CCMainTabBarController *tab = [[CCMainTabBarController alloc] init];
//    
//    //设置UIWindow的根控制器
//    self.window.rootViewController = tab;
    
    //统一设置导航栏外观
    [self setNavigationBarStyle];
    
    //统一设置状态栏外观
    [self setStatusBarStyle:application];
    
    //设置self.window 为主窗口并显示
    [self.window makeKeyAndVisible];
    
    return YES;
}

//选择启动控制器
- (void)chooseStartController
{
    //获取当前APP版本号    CFBundleShortVersionString
    NSString *current_version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    //获取保存在偏好设置中的版本号
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    NSString *app_ver = [userD objectForKey:@"app_version"];
    
    //比较偏好设置中的版本号和当前app的版本号
    if ([current_version isEqualToString:app_ver]) {
        //表示不是第一次启动 也不是更新后的第一次启动
        NSLog(@"不是第一次启动");
        
        //创建UITabBarController
        CCMainTabBarController *tab = [[CCMainTabBarController alloc] init];
        
        //设置UIWindow的根控制器
        self.window.rootViewController = tab;
        
    }else {
        //表示是第一次启动 或 更新后第一次启动
        NSLog(@"第一次启动");
        
        CCGuideController *guideVC = [[CCGuideController alloc] init];
        self.window.rootViewController = guideVC;
    }
    
    //无论是否第一次启动
    [userD setObject:current_version forKey:@"app_version"];
    [userD synchronize];
}

//统一设置状态栏外观
- (void)setStatusBarStyle:(UIApplication *)application
{
    //状态栏
    //TARGETS -> General -> Development Info -> Status Bar Style -> Hide status bar: 这里勾选上 表示启动时 不显示状态栏 但当控制器加载后 状态栏会显示默认状态(状态栏默认由控制器管理，启动时 控制器未加载 不显示状态栏，启动后，控制器中未管理状态栏仍显示默认状态)
    
    //info.plist文件中View controller-based status bar appearance设置为NO 状态栏不由控制器管理
    
    //效果: 启动时 不显示状态栏 -> 启动后 显示状态栏且字体颜色为白色
    application.statusBarHidden = NO;
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
}

//统一设置导航栏外观
- (void)setNavigationBarStyle
{
    //获取导航栏的外观代理对象
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //统一设置
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题文字 command + shift + o    -->UIKit
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //修改返回按钮的文字颜色
    [bar setTintColor:[UIColor whiteColor]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
