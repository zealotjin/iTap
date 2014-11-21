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


@interface GameModel : NSObject
{
    
    @private
    NSInteger time;
    NSInteger numUser;
    UserModel* startingUser;
    NSMutableArray* users;
    NSInteger turnTime;
    UserModel* userWithBomb;

}
+(id)getGameModel;
-(UserModel*) getStartingUser;
-(NSInteger) getTime;
-(NSString*) finish;
-(NSInteger) setTime: (NSInteger) lowerBound to:(NSInteger)upperBound;
-(NSInteger) getTurnTimer;
-(UserModel*) getNextTurn: (UserModel*) currUser;
@end
