//
//  Count.m
//  PHTManager
//
//  Created by Rapha Solution on 10/2/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTGeneralAnalyticsManager.h"
#import "PRTTimer.h"
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
    PRTTimer *timer = [[PRTTimer alloc] init];
    [timer start];
    timeTracking[aTimeKey] = timer;
    [self getTimeElapsed:aTimeKey];
  
}

- (void)stopTimer:(NSString *)aTimeKey {
    PRTTimer *stopTimer = timeTracking[aTimeKey];
    [stopTimer stop];
}

- (void)restartTimer:(NSString *)aTimeKey {
    PRTTimer *stopTimer = timeTracking[aTimeKey];
    [stopTimer restart];
}

- (int)getTimeElapsed:(NSString *)aTimeKey {
    PRTTimer *timer = timeTracking[aTimeKey];
    [self getTimerHasStarted:aTimeKey];
    if(timer!=nil){
        
        return [timer elapsedSeconds];
    }
    else{
        return 0;
    }
    
}

- (BOOL)getTimerHasStarted:(NSString *)aTimeKey {
    
    PRTTimer *timer = timeTracking[aTimeKey];
    if(timer!=nil){
        NSLog(@"True");
        return true;
    }
    else{
         NSLog(@"false");
        return false;
    }
}


@end
