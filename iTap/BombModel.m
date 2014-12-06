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

@synthesize bombStatus;
@synthesize difficulty;





-(id) initWithDifficulty:(NSInteger) diff{
    difficulty = diff;
    bombStatus= 0;
    return self;

}
-(void) incrementBombStatus{
    bombStatus++;
}








@end
