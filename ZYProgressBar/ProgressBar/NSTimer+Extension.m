//
//  NSTimer+Extension.m
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import "NSTimer+Extension.h"

@implementation NSTimer (Extension)

- (void)pause {
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)restart {
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
}

- (void)reStartWithTimeInterval:(NSTimeInterval)interval {
    if (!self.isValid) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
