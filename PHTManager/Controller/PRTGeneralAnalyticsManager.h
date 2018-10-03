//
//  Count.h
//  PHTManager
//
//  Created by Rapha Solution on 10/2/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

@interface PRTGeneralAnalyticsManager : NSObject {
    
    NSMutableDictionary *countTracking;
    NSMutableDictionary *timeTracking;
}

+(PRTGeneralAnalyticsManager *)instance;

-(void)startTimer:(NSString *)aTimeKey;
-(void)stopTimer:(NSString *)aTimeKey;
-(void)restartTimer:(NSString *)aTimeKey;


-(void)increase:(NSString *)aCountKey;
-(void)decrease:(NSString *)aCountKey;

-(int)getCount:(NSString *)aCountKey;
-(void)setCount:(NSString *)aCountKey withCount:(int)aCount;

-(int)getTimeElapsed:(NSString *)aTimeKey;
-(BOOL)getTimerHasStarted:(NSString *)aTimeKey;

@end
