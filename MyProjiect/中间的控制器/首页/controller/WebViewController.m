//
//  WebViewController.m
//  MyProjiect
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "WebViewController.h"
#import "SearchViewController.h"
#import "MBProgressHUD.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载webView;
    
    
    self.webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    _webView.delegate=self;

    [self loadString:_htmlString];
    
}


// 让浏览器加载指定的字符串,使用m.baidu.com进行搜索
- (void)loadString:(NSString *)htmlStr
{
    // 1. URL 定位资源,需要资源的地址
    NSString *urlStr = htmlStr;
//    if (![htmlStr hasPrefix:@"http://"]) {
//        urlStr = [NSString stringWithFormat:@"http://m.baidu.com/s?word=%@", htmlStr];
//    }
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 发送请求给服务器
    [self.webView loadRequest:request];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
//  NSLog(@"request is %@",request);
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webView 开始加载");
    [self showHud:@"加载ing"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webVIew 加载完成");
    
    [self comleteLoading:@"加载完成"];
}

@end
