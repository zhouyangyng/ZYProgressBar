# ZYProgressBar

使用webView时，为了用户体验，加入进度条，本项目橙色进度条，加在 navigatioonBar上，颜色可以自己改。

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

![image](https://github.com/zhouyangyng/ZYProgressBar/blob/master/image/000.png)

![image](https://github.com/zhouyangyng/ZYProgressBar/blob/master/image/111.gif)



