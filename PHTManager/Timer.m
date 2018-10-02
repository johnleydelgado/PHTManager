//
//  PHTManagerV2.m
//  PHTManager
//
//  Created by Rapha Solution on 10/2/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"

@implementation Timer
/*  instantiate */
+ (Timer *) instance {
    static dispatch_once_t once;
    static Timer *_sharedManager = nil;
    
    dispatch_once(&once,^{
        _sharedManager = [[self alloc] init];
        _sharedManager->timer = [[NSTimer alloc] init];
        _sharedManager->date = [[NSDate alloc]init];
    });
    
    return _sharedManager;
    
}



- (void)start {
    //check if timer has a value
    //if timer have a value make it nil and invalidate it.
    //
    if(timer){
        pausedTime += [[NSDate date] timeIntervalSinceDate:date];
        [timer invalidate];
        timer = nil;
    }
    [self newTimer];
}
- (void)restart {
    if(timer){
        [timer invalidate];
        timer = nil;
        pausedTime = 0.0;
        [self newTimer];
    }
    else{
        pausedTime = 0.0;
        [self newTimer];
    }
    
}
- (int)elapsedSeconds:(int)time {
    elapsedTime = time;
    return time;
}
- (void)pause {
    if(timer){
        pausedTime += [[NSDate date] timeIntervalSinceDate:date];
        [timer invalidate];
        timer = nil;
    }
}
- (void)stop {
    if(timer){
        [timer invalidate];
        timer = nil;
       pausedTime = 0.0;
    }
}
-(void) newTimer {
    date = [NSDate date];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setFire:) userInfo:self repeats:YES];
}
-(void) setFire:(NSTimer *)timer {
    
    NSTimeInterval seconds = -[date timeIntervalSinceNow];
    elapsedTime = pausedTime+seconds;
    int hours = elapsedTime / 3600;
    int minutes = (elapsedTime - hours * 3600) / 60;
    NSString *timeStr = [NSString stringWithFormat:@"%i:%i:%f", hours, minutes,elapsedTime];
    [self elapsedSeconds:elapsedTime];
    NSLog(@"%@",timeStr);
}
@end
