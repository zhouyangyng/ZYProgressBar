//
//  ZYProgressLayer.h
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define layerWidth 3

@interface ZYProgressLayer : CAShapeLayer

- (void)finishedLoad;
- (void)startLoad;

- (void)closeTimer;

@end
