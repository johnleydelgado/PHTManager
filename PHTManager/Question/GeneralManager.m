//
//  test.m
//  Testing
//
//  Created by Rapha Solution on 9/28/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneralManager.h"

@implementation GeneralManager

+ (GeneralManager *)instance{
    static GeneralManager* sharedManager = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        sharedManager = [[GeneralManager alloc] init];
    });
    
    return sharedManager;
    
}


- (int)getA{
    
    return x;
    
}
-(int)getB{
    
    return y;
 
}
- (void)setA:(int) a{
    
     x = a;
}

- (void)setB:(int) b {
     y = b;
}

@end
