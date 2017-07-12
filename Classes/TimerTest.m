//
//  TimerTest.m
//  TestO
//
//  Created by igeak on 2017/6/15.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TimerTest.h"

@implementation TimerTest

-(void)testTimer{
    NSTimer *timer=[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)run{
    NSLog(@"----run");
}
@end
