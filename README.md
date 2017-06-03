# ZYProgressBar

使用时，直接把 ProgressBar文件夹 拖入项目中，添加方法可参考 ZYWebViewController.m 文件。

初始化
-(ZYProgressLayer *)progressLayer {

    if(nil == _progressLayer) {

        _progressLayer = [[ZYProgressLayer alloc]init];
        _progressLayer.frame = CGRectMake(0, 44-layerWidth, [UIScreen mainScreen].bounds.size.width, layerWidth);
    }

    return _progressLayer;
}

[self.navigationController.navigationBar.layer addSublayer:self.progressLayer];


开始和结束
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {

    [self.progressLayer startLoad];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {

    [self.progressLayer finishedLoad];

}

https://github.com/zhouyangyng/ZYProgressBar/image/000.png

https://github.com/zhouyangyng/ZYProgressBar/image/111.gif



