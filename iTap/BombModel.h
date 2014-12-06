//
//  BombModel.h
//  iTap
//
//  Created by Kangsik Kevin Lee on 11/15/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BombModel : NSObject
{   @private
    NSInteger bombStatus;
    NSInteger difficulty;
    
}

@property NSInteger bombStatus;
@property NSInteger difficulty;


-(id) initWithDifficulty:(NSInteger) diff;
-(void) incrementBombStatus;




@end
