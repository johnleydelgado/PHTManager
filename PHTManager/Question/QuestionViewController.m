//
//  ViewController.m
//  Testing
//
//  Created by Rapha Solution on 9/28/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import "QuestionViewController.h"

#import "PRTGeneralAnalyticsManager.h"

#import "Timer.h"
@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Timer *sharedManager = [Timer instance];
    [sharedManager start];
    [[PRTGeneralAnalyticsManager instance]setCount:@"Count" withCount:0];
    [self Question:0];

}

- (void) Question:(NSInteger)numberOfCurrentQuestion{
    if (currentQuestion > 2){
        [[Timer instance]stop];
        [[PRTGeneralAnalyticsManager instance]getCount:@"Count"];
    }
    else{
        _question = @[@"what is the capital of the Philippines?", @"what are the sum of 1 and 2?", @"How many days of month in february in the year of 2016"];
        
        
        [self ShowAlert:numberOfCurrentQuestion];
    }
    
}


- (void) GetTheNumberOfWrongAnswer :(NSInteger)wrongAnswer{
    
   // NSLog(@"The number of wrong is %d",(int)wrongAnswer);
    
}

- (void) CheckingAnswer:(NSString *)theAnswer {
    
    _correctAnswer = @[@"Manila", @"3", @"26"];
    //NSString *currentQuestion = [@(_currentQuestion) stringValue];
    
    if( [_correctAnswer[currentQuestion]  isEqual: theAnswer]) {
        
        [self GetTheNumberOfWrongAnswer: wrongAnswerCount];
        
        currentQuestion +=1;
       // wrongAnswerCount = 0;
        [self Question:currentQuestion];
        
    }
    else{
        
      //  wrongAnswerCount +=1;
        [[PRTGeneralAnalyticsManager instance]increase:@"Count"];
        
        [self GetTheNumberOfWrongAnswer: wrongAnswerCount];
        [self Question:currentQuestion];
        
    }
    
}

- (void) ShowAlert:(NSInteger)currentQuestion{
    
    UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.windowLevel = UIWindowLevelAlert + 1;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Question: " message:_question[currentQuestion]  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                         {
                             NSString *textfieldvalue = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                           
                             // [[PRTGeneralAnalyticsManager instance] getTimerHasStarted:@"timer"];
                             [self CheckingAnswer:textfieldvalue];
                         }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancel];
    [alert addAction:ok];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Answer";
        textField.keyboardType = UIKeyboardTypeDefault;
        
    }];
    [window makeKeyAndVisible];
    [window.rootViewController presentViewController:alert animated:YES completion:nil];
    
}


@end
