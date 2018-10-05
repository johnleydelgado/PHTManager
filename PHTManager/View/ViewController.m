//
//  ViewController.m
//  PHTManager
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import "ViewController.h"

#import "PRTTimer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
}
- (IBAction)startButton {
    [[PRTTimer instance]start];
}
- (IBAction)resetButton {
    [[PRTTimer instance] restart];
    
}
- (IBAction)pauseButton {
    [[PRTTimer instance] pause];
}
- (IBAction)stopButton {
    [[PRTTimer instance] stop];
}
@end
