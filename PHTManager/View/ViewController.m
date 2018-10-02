//
//  ViewController.m
//  PHTManager
//
//  Created by Rapha Solution on 10/1/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import "ViewController.h"

#import "Timer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
}
- (IBAction)startButton {
    [[Timer instance]start];
}
- (IBAction)resetButton {
    [[Timer instance] restart];
}
- (IBAction)pauseButton {
    [[Timer instance] pause];
}
- (IBAction)stopButton {
    [[Timer instance] stop];
}
@end
