//
//  UserModel.m
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize name;

-(id) initWithName: (NSString*) UserName{
    
    name = UserName;
    turn = NO;
    score = 0;    
    return self;

    //comment test
    //asdf  
}



-(NSInteger*) getScore{
    
    return score;
}

-(void) addScore: (NSInteger*) scoreGained{
    score = *score + scoreGained;
}

-(BOOL) getTurn{
    return turn;
}

- (void) noTurn{
    turn = NO;
}

- (void) yesTurn{
    turn = YES;
}




@end
