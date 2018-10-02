//
//  Test_h.h
//  Testing
//
//  Created by Rapha Solution on 9/28/18.
//  Copyright © 2018 Rapha Solution. All rights reserved.

@interface GeneralManager: NSObject{
    
    int x;
    int y;
    
}

+ (GeneralManager *)instance;

-(int) getA;
-(int) getB;
-(void) setA:(int)a;
-(void) setB:(int)b;
@end
