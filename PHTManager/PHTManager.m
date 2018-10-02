//
//  PhTimer.m
//  Timer
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHTManager.h"

@implementation PHTManager
/*  instantiate */
+ (PHTManager *) instance {
    static dispatch_once_t once;
    static PHTManager *_sharedManager = nil;
    
    dispatch_once(&once,^{
        _sharedManager = [[self alloc] init];
        _sharedManager->timer = [[NSTimer alloc] init];
        
        
    });
    
    return _sharedManager;
    
}
//start time
- (void)startTimer {
    //check if timer has a value
    //if timer have a value make it nil and invalidate it.
    //
    if(timer){
        [timer invalidate];
        timer = nil;
    }
    [self newTimer];
    
}

- (void)stopTimer {
    if(timer){
        [timer invalidate];
        timer = nil;
        [self elapsedSeconds:0];
    }
}

- (void)pausedTimer{
   
    if(timer){
        [timer invalidate];
        timer = nil;
        NSLog(@"timer is pause");
       // NSNumber *n =[[NSNumber numberWithDouble:*(startTime)] doubleValue];
      //  elapsedTime = currentTime2 - pausedTimeDifference - n;
        
    }
}



- (void)restartTimer {
    if(timer){
        [timer invalidate];
        timer = nil;
        [self elapsedSeconds:0];
        [self newTimer];
    }
    else{
        
        [self elapsedSeconds:0];
        [self newTimer];
    }
}

- (int)elapsedSeconds:(int)time {
    currentTime = time;
    return time;
}


- (void)setFire:(NSTimer *)timer{
    
    currentTime +=1;
    [self elapsedSeconds:currentTime];
    
    NSLog(@"%d",currentTime);
    
}

-(void) newTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setFire:) userInfo:self repeats:YES];
}

@end
