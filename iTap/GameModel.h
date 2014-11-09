//
//  GameModel.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface GameModel : NSObject
{
    @private
    NSInteger time;
    NSInteger numUser;
    UserModel* startingUser;
    NSMutableArray* users;

}
-(id) init: (NSInteger) numUser andUsers:(NSMutableArray*) userList;
-(UserModel*) getStartingUser;
-(NSInteger) getTime;
-(NSString*) finish;
-(NSInteger) setTime: (NSInteger) lowerBound to:(NSInteger)upperBound;

@end
