//
//  GameController.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BombModel.h"

@interface GameController : UIViewController
{   
    NSInteger lowerTimeBound;
    NSInteger upperTimeBound;
    NSTimer* bombTimer;
    NSInteger bombStatus;
    BombModel *bomb;
}





-(void) changeBombStatus:(NSTimer *) timer;
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower;


@end
