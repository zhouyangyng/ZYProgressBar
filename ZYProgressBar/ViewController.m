//
//  ViewController.m
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import "ViewController.h"
#import "ZYWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_image"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"首页";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
}


- (IBAction)openUrl:(UIButton *)sender {
    
    ZYWebViewController *vc = [[ZYWebViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}




@end






