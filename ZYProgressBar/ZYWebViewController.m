//
//  ZYWebViewController.m
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import "ZYWebViewController.h"
#import <WebKit/WebKit.h>
#import "ZYProgressLayer.h"

@interface ZYWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) ZYProgressLayer *progressLayer;

@end

@implementation ZYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    
    // Add ProgressBar
    [self.navigationController.navigationBar.layer addSublayer:self.progressLayer];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://baidu.com"]]];
}


#pragma mark --
#pragma mark -- WKNavigationDelegate

#pragma mark --
#pragma mark -- WebViewStartLoad
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    [self.progressLayer startLoad];
}

#pragma mark --
#pragma mark -- WebVieFinishtLoad
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [self.progressLayer finishedLoad];

}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"title"]) {
        
        self.navigationItem.title = change[@"new"];
    }
}

-(void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:@"title"];
}

//lazyLoad
- (WKWebView *)webView {
    
    if(nil == _webView) {
        
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _webView;
}

-(ZYProgressLayer *)progressLayer {
    
    if(nil == _progressLayer) {
        
        _progressLayer = [[ZYProgressLayer alloc]init];
        _progressLayer.frame = CGRectMake(0, 44-layerWidth, [UIScreen mainScreen].bounds.size.width, layerWidth);
    }
    return _progressLayer;
}

@end








