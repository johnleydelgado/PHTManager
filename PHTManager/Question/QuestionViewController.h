//
//  ViewController.h
//  Testing
//
//  Created by Rapha Solution on 9/28/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController {
    
    int wrongAnswerCount;
    int currentQuestion;
}

@property (nonatomic,strong) NSArray *correctAnswer;
@property (nonatomic,strong) NSArray *question;

@property (nonatomic,strong) NSString *userInput;


//- (void) Answering : (NSString *)answer;
- (void) CheckingAnswer : (NSString*)theAnswer;
- (void) Question:(NSInteger)numberOfCurrentAnswer;
- (void) GetTheNumberOfWrongAnswer: (NSInteger)wrongAnswer;
- (void) ShowAlert : (NSInteger)currentQuestion;

@end

