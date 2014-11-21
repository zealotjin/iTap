//
//  BombModel.h
//  iTap
//
//  Created by Kangsik Kevin Lee on 11/15/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BombModel : NSObject
{   @private
    NSInteger lowerTimeBound;
    NSInteger upperTimeBound;
    NSTimeInterval randomTime;
    NSTimer* bombTimer;
    NSInteger bombStatus;
}

@property NSInteger lowerTimeBound;
@property NSInteger upperTimeBound;
@property NSInteger randomTime;
@property NSInteger *bombStatus;
@property NSTimer* bombTimer;
@property BOOL explode;


-(id) initWithRandomTime;
-(void) countDown:(NSTimer *) timer;
-(void) resetBombTimer;



@end
