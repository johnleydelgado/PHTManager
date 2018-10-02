//
//  ViewController.m
//  Testing
//
//  Created by Rapha Solution on 9/28/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import "QuestionViewController.h"
#import "GeneralManager.h"
@interface QuestionViewController ()

@end

@implementation QuestionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    GeneralManager *sharedManager = [GeneralManager instance];
    //[sharedManager setA:]
    [sharedManager setA:2];
    NSLog(@"%d", [sharedManager getA]);
    
        // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
