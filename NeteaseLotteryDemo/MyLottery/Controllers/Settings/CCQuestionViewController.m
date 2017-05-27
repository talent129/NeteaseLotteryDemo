//
//  CCQuestionViewController.m
//  NeteaseLotteryDemo
//
//  Created by mac on 17/5/27.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CCQuestionViewController.h"

@interface CCQuestionViewController ()<UIWebViewDelegate>

@end

@implementation CCQuestionViewController


- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //尝试加载一个网页
    UIWebView *webView = (UIWebView *)self.view;
    
    //设置代理
    webView.delegate = self;
    
    //创建一个要加载的网页url
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //本地网页
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"help.html" withExtension:nil];
    
    //创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //加载请求对象
    [webView loadRequest:request];
    
}

//webView的代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //编写要执行的代码  -->定位到某个地方 这里例如如何提现?
    NSString *jsCode = [NSString stringWithFormat:@"document.location.href = '#%@';", @"howtowithdraw"];
    
    //执行这段代码
    [webView stringByEvaluatingJavaScriptFromString:jsCode];
    
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
