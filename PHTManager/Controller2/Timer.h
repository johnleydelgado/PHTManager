//
//  PHTManagerV2.h
//  PHTManager
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

@interface Timer: NSObject
{
    
    NSTimer *timer;
   // int currentTime;
    double elapsedTime;
   // double pausedTimeDifference;
    //double timeUserPaused;
    //double currentTime2;
    NSTimeInterval pausedTime;
    NSDate *date;
}

+(Timer *) instance;

-(void) start;
-(void) stop;
-(void) pause;
-(void) restart;
-(int) elapsedSeconds:(int)time;


@end
