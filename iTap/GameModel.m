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
    return self;
}
-(UserModel*) getStartingUser{
    return [users objectAtIndex:0];
}
-(NSInteger) getStartTime: (NSInteger) lowerBound to:(NSInteger)upperBound{
    return lowerBound + arc4random_uniform(upperBound - lowerBound + 1);
}
-(NSString*) finish{
    //returns a string that includes the user who lost
    return @"finish";
}
@end
