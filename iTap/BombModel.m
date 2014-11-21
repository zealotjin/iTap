//
//  BombModel.m
//  iTap
//
//  Created by Kangsik Kevin Lee on 11/15/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "BombModel.h"
#include <stdlib.h>

@implementation BombModel


-(id) initWithRandomTime{
                          
    bombStatus= 0;
    *lowerTimeBound = 90;
    *upperTimeBound = 240;
    *randomTime =(NSTimeInterval)*lowerTimeBound + arc4random() % (*upperTimeBound - *lowerTimeBound);
    bombTimer = [NSTimer scheduledTimerWithTimeInterval: *randomTime
                                             target:self
                                             selector:@selector(countDown:)
                                             userInfo:nil
                                             repeats:NO];
    return self;

}

-(void) countDown:(NSTimer *) timer{
    *randomTime -=1;
    //as time left changes, it will change status of the bomb
    switch((int)*randomTime){
        case 60:
            *bombStatus = 1;
            break;
        case 30:
            *bombStatus = 2;
            break;
        case 10:
            *bombStatus = 3;
            break;
        case 0:
            *bombStatus = 4;
            [timer invalidate];
            break;
    }
  
}

-(void) resetBombTimer{
    
    *randomTime = *lowerTimeBound + arc4random() % (*upperTimeBound - *lowerTimeBound);
    bombTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countDown:)
                                           userInfo:nil
                                            repeats:NO];
    *bombStatus = 0;
    
}



@end
