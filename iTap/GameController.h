//
//  GameController.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "TabView.h"
#import "GameModel.h"
#import "BombModel.h"

@class TabView;

@interface GameController : UIViewController
{
    TabView* view;
    GameModel* gameModel;
    NSInteger lowerTimeBound;
    NSInteger upperTimeBound;
    NSTimer* bombTimer;
    NSInteger bombStatus;
    BombModel *bomb;
}

//@property (retain) IBOutlet TabView* view;


- (NSInteger)askNumUsers;




-(void) changeBombStatus:(NSTimer *) timer;
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower;


@end
