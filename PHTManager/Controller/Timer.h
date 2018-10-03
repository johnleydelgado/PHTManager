//
//  PHTManagerV2.h
//  PHTManager
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

@interface Timer: NSObject
{
    /*! @brief this will be the value of nstimer that ticks every seconds*/
    NSTimer *timer;
    
     /*! @brief the value of seconds in our timer*/
    double elapsedTime;
    
    /*! @brief saved the value of elapsed time
     @discussion  pausedTime += [[NSDate date] timeIntervalSinceDate:date]; ,  */
    NSTimeInterval pausedTime;
    
    /*! @brief just a date*/
    NSDate *date;
}
/*! @brief instance of our class*/
+(Timer *) instance;

/*!
 @brief it will call the new timer function to starts the timer
 @code  [self newTimer];
 @discussion always check if the timer has a value , if yes then make it nil and call again the new timer functions,
 also do this  pausedTime += [[NSDate date] timeIntervalSinceDate:date]; to save your current timer value
 */
-(void) start;

/*! @brief it will stop the timer
  @discussion set the pausedTime equals to 0 and make your timer is equal to nill*/

-(void) stop;

/*! @brief it will pause the timer *
 @discussion  also do this  pausedTime += [[NSDate date] timeIntervalSinceDate:date]; to save your current timer value */
-(void) pause;

/*! @brief it will restart the timer
    @discussion set the pausedTime equals to 0 and make your timer is equal to nill
 */
-(void) restart;

/*! @brief this will get the return value of int which is the value of the field elapsedTime */
-(int) elapsedSeconds;


@end
