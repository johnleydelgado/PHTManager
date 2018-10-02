//
//  PhTimer.h
//  Timer
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

@interface PHTManager: NSObject
{
    
    NSTimer *timer;
    int currentTime;

    NSTimeInterval *startTime;
    
}

+(PHTManager *) instance;

-(void) startTimer;
-(void) stopTimer;
-(void) pausedTimer;
-(void) restartTimer;
-(int) elapsedSeconds:(int)time;
-(void) setFire:(NSTimer *)timer;
@end
