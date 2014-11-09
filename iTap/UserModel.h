//
//  UserModel.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
{
    @private
    NSString* name;
    BOOL turn;
    NSInteger* score;
    
}

@property NSString* name;
@property NSInteger* score;

-(id) init;
-(void) setName: (NSString*) name;
-(NSString*) getName;
-(NSInteger*) getScore;
-(void) addScore: (NSInteger*) scoreGained;
-(BOOL) getTurn;
-(void) noTurn;
-(void) yesTurn;

@end
