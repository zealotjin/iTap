//
//  GameModel.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"


extern NSInteger *const EasyLevel;
extern NSInteger *const MediumLevel;
extern NSInteger *const MasterLevel;
extern NSInteger *const EasyLowerTime;
extern NSInteger *const MediumLowerTime;
extern NSInteger *const MasterLowerTime;
extern NSInteger *const MasterHighTime;


@interface GameModel : NSObject
{
    
    @private
    NSInteger time;
    NSInteger numUser;
    UserModel* startingUser;
    NSMutableArray* users;
    NSInteger turnTime;
    UserModel* userWithBomb;
    NSInteger gameLevel;
    NSInteger predictedNextTurn;


}
+(id)getGameModel;
-(void) initialize;
-(UserModel*) getStartingUser;
-(NSInteger) getTime;
-(NSString*) finish;
-(NSInteger) getTurnTimer;
-(NSInteger) getNextTurn;
-(NSInteger) getNumUsers;

-(NSInteger) getGameLevel;
-(NSInteger) getUserTime;

-(BOOL) validate: (NSInteger)currUser withTap: (NSInteger) tapCount;

-(NSInteger) calculateNextUser: (NSInteger) currentUser withNumTaps: (NSInteger) numTaps;


-(NSInteger) setTime: (NSInteger) lowerBound to:(NSInteger)upperBound;
-(void) setNumUsers: (NSInteger) numUsers;
-(NSInteger) getUserTime;

@end
