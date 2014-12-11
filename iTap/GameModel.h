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

}
+(id)getGameModel;
-(UserModel*) getStartingUser;
-(NSInteger) getTime;
-(NSString*) finish;
-(NSInteger) getTurnTimer;
-(UserModel*) getNextTurn: (UserModel*) currUser;
-(NSInteger) getNumUsers;
-(NSInteger) getGameLevel;
-(NSInteger) getUserTime;



-(NSInteger) setTime: (NSInteger) lowerBound to:(NSInteger)upperBound;
-(void) setNumUsers: (NSInteger) numUsers;
-(NSInteger) getUserTime;
@end
