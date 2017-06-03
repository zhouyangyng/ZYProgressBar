//
//  ZYProgressLayer.m
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import "ZYProgressLayer.h"
#import "NSTimer+Extension.h"

#define layerWidth 3
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface ZYProgressLayer ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat deltaWidth;

@property (nonatomic, assign) CGFloat timeInterval; 

@end

@implementation ZYProgressLayer

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}


- (void)initialize {
    
    self.timeInterval = 0.003;
    
    self.lineWidth = layerWidth;
    self.strokeColor = UIColorFromRGB(0xF9D55C).CGColor;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(pathChanged:) userInfo:nil repeats:YES];
    [_timer pause];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, layerWidth)];
    [path addLineToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width, layerWidth)];
    
    self.path = path.CGPath;
    self.strokeEnd = 0;
    self.deltaWidth = 0.01;
}

- (void)pathChanged:(NSTimer *)timer {
    
    self.strokeEnd += self.deltaWidth;
    
    if (self.strokeEnd > 0.7) {
        self.deltaWidth = 0.0002;
    }
}

- (void)startLoad {
    
    [self.timer reStartWithTimeInterval:self.timeInterval];
}

- (void)finishedLoad {
    [self closeTimer];
    
    self.strokeEnd = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        [self removeFromSuperlayer];
    });
}

- (void)dealloc {
    
    [self closeTimer];
}

#pragma mark - private
- (void)closeTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
