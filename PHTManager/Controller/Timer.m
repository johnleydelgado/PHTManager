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
// start the timer
- (void)start {
    if(timer){
        pausedTime += [[NSDate date] timeIntervalSinceDate:date];
        [timer invalidate];
        timer = nil;
        NSLog(@"Timer had been started");
    }
    [self newTimer];
}
//restart the timer
- (void)restart {
    
    if(timer){
        [timer invalidate];
        timer = nil;
        pausedTime = 0.0;
        [self newTimer];
        NSLog(@"Timer had been restarted");
    }
    else{
        pausedTime = 0.0;
        [self newTimer];
        NSLog(@"Timer had been restarted");
    }
    
}

//pause the timer
- (void)pause {
    if(timer){
        pausedTime += [[NSDate date] timeIntervalSinceDate:date];
        [timer invalidate];
        timer = nil;
        NSLog(@"Timer had been paused");
    }
    else{
        NSLog(@"Timer had been paused");
    }
}

//stop the timer
- (void)stop {
    if(timer){
        [timer invalidate];
        timer = nil;
        pausedTime = 0.0;
        NSLog(@"Timer had been stopped");
    }
    else{
        pausedTime = 0.0;
        NSLog(@"Timer had been stopped");
    }
}

//get set elapse time
- (int)elapsedSeconds {
    return (int) elapsedTime;
}

//start the time interval and initiate date as nsdate
-(void) newTimer {
    date = [NSDate date];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setFire:) userInfo:self repeats:YES];
}
//call every 1 seconds
-(void) setFire:(NSTimer *)timer {
    
    NSTimeInterval seconds = -[date timeIntervalSinceNow];
    elapsedTime = pausedTime+seconds;
    int hours = elapsedTime / 3600;
    int minutes = (elapsedTime - hours * 3600) / 60;
    NSString *timeStr = [NSString stringWithFormat:@"%i:%i:%.f", hours, minutes,elapsedTime];
    NSLog(@"%@",timeStr);
}
@end
