//
//  NSTimer+Extension.h
//  ZYProgressBar
//
//  Created by 周洋 on 2017/5/28.
//  Copyright © 2017年 zhouyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)


- (void)pause;
- (void)restart;
- (void)reStartWithTimeInterval:(NSTimeInterval)interval;

@end
