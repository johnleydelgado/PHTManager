//
//  Count.m
//  PHTManager
//
//  Created by Rapha Solution on 10/2/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTGeneralAnalyticsManager.h"
#import "Timer.h"
@implementation PRTGeneralAnalyticsManager

+ (PRTGeneralAnalyticsManager *)instance{
    
    static dispatch_once_t once;
    static PRTGeneralAnalyticsManager *_sharedManager = nil;
    dispatch_once (&once,^{
        _sharedManager = [[self alloc]init];
        _sharedManager->countTracking = [[NSMutableDictionary alloc]init];
        _sharedManager->timeTracking = [[NSMutableDictionary alloc]init];
    });
    
    return _sharedManager;
    
}

- (void)setCount:(NSString *)aCountKey withCount:(int)aCount{
    countTracking[aCountKey] = [NSNumber numberWithInt:aCount];
    NSString *countKey = countTracking[aCountKey];
   
    if(countKey!=nil){
        // NSLog(@"set count is:%@",countKey);
        [self getTimeElapsed:@"timer"];
      
    }
}


- (int)getCount:(NSString *)aCountKey{
    
    NSString *countKey = countTracking[aCountKey];
    if(countKey!=nil){
       // NSLog(@"the getCount is :%@",countKey);
    }

    return [countKey intValue];
}

- (void)increase:(NSString *)aCountKey{
    NSString *countKey = countTracking[aCountKey];
   
    if(countKey!=nil){
        int count = [countKey intValue];
        count ++;
        [self setCount:aCountKey withCount:count];
        
       // NSLog(@"the wrong answer is :%d",count);
    }

}

- (void)decrease:(NSString *)aCountKey{
    NSString *countKey = countTracking[aCountKey];
    int count = 0;
    if([countKey isEqual: [NSNull null]]){
        
    }
    else{
        count = [self getCount:aCountKey];
        count-=1;
    }
}

- (void)startTimer:(NSString *)aTimeKey {
    NSTimer *timer = timeTracking[aTimeKey];
    if(timer!=nil){
      //  NSLog(@"the timer started :%@",timer);
    }

}

- (void)stopTimer:(NSString *)aTimeKey {
    NSTimer *timer = timeTracking[aTimeKey];
    if(timer!=nil){
     //   NSLog(@"the timer is stopped :%@",timer);
    }
}

- (void)restartTimer:(NSString *)aTimeKey {
    NSTimer *timer = timeTracking[aTimeKey];
    if(timer!=nil){
       // NSLog(@"the timer is restarted :%@",timer);
    }
}

- (int)getTimeElapsed:(NSString *)aTimeKey {
    int timeElapsed = [[Timer instance ] elapsedSeconds];
    timeTracking[aTimeKey] = [NSNumber numberWithInt:timeElapsed];
    NSTimer *timer = timeTracking[aTimeKey];
    if(timer!=nil){
        //NSLog(@"the timer is :%@",timer);
        [self getTimerHasStarted:@"timer"];
    }
    
   return timeElapsed;
    
}

- (BOOL)getTimerHasStarted:(NSString *)aTimeKey {
    
    NSNumber *timeHasStarted = timeTracking[aTimeKey];
    if(timeHasStarted!=nil){
        timeHasStarted = [NSNumber numberWithBool:YES];
       // NSLog(@"Bool is : %@",timeHasStarted);
    }
    return timeHasStarted;
    
}


@end
