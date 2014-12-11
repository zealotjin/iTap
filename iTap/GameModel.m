//
//  GameModel.m
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "GameModel.h"

NSInteger *const EasyLevel = 0;
NSInteger *const MediumLevel = 1;
NSInteger *const MasterLevel = 2;

NSInteger *const EasyLowerTime = 1;
NSInteger *const MediumLowerTime = 3;
NSInteger *const MasterLowerTime = 5;
NSInteger *const MasterHighTime= 7;


@implementation GameModel

static GameModel* gameModel = nil;

+(id) getGameModel{


    @synchronized(self){
        if(gameModel == nil){
            gameModel = [[self alloc]init];
            
        }
    }
    return gameModel;
}
-(void) initialize{
    predictedNextTurn = -1;
}
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
    NSLog(@"Random Number %zd",arc4random_uniform(upperBound - lowerBound+1));
    return time;
}

-(NSString*) finish{
    //returns a string that includes the user who lost
    return [userWithBomb getName];
}

-(NSInteger) getTurnTimer{
    return turnTime;
}
-(NSInteger) getNextTurn{
    return predictedNextTurn;
}
-(NSInteger) getNumUsers{
    return numUser;
}

-(void) setNumUsers: (NSInteger) numUsers{
    numUser = numUsers;
}

-(BOOL) validate: (NSInteger)currUser withTap: (NSInteger) tapCount{
    BOOL output = NO;
    if (currUser == predictedNextTurn){
        output = YES;
    }
    [self calculateNextUser:currUser withNumTaps:tapCount];
    
    return output;
}
-(NSInteger) calculateNextUser: (NSInteger) currUser withNumTaps: (NSInteger) tapCount{
    //update the predictedNextTurn
    NSLog(@"!!!!!!!!!!!!!!!!!!!!tapcount %zd", tapCount);
    switch (tapCount) {
        case 1:
            predictedNextTurn = (currUser + 1) % 3;
            break;
        case 2:
            if(currUser == 0){
                predictedNextTurn = 2;
            }else{
                predictedNextTurn = currUser - 1;
            }
            break;
        case 3:
            predictedNextTurn = (currUser +2 ) % 3;
            break;
    }
    NSLog(@"the nextTurn should be: %zd", predictedNextTurn);
    
    return 0;
}

@end
