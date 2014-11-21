//
//  GameModel.m
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel
-(id) init: (NSInteger) num andUsers:(NSMutableArray *)userList{
    numUser = num;
    users = userList;
    time = 0;
    turnTime = 2;
    return self;
}
-(UserModel*) getStartingUser{
    return [users objectAtIndex:0];  //could be randomly chosen
}
-(NSInteger) getTime{
    return time;
}
-(NSInteger) setTime: (NSInteger) lowerBound to:(NSInteger)upperBound{
    time =lowerBound + arc4random_uniform(upperBound - lowerBound + 1);
    return time;
}

-(NSString*) finish{
    //returns a string that includes the user who lost
    return [userWithBomb getName];
}

-(NSInteger) getTurnTimer{
    return turnTime;
}
-(UserModel*) getNextTurn: (UserModel*) currUser{
    int currIndex = [users indexOfObject:currUser];
    return users[(currIndex+1)%([users count])];
}
@end
