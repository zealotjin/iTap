//
//  GameController.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TabView.h"
#import "GameModel.h"
#import "BombModel.h"

@interface GameController : UIViewController
{
    IBOutlet TabView* viewer;
    GameModel* gameModel;
    NSInteger lowerTimeBound;
    NSInteger upperTimeBound;
    NSTimer* bombTimer;
    NSInteger bombStatus;
    BombModel *bomb;
    UIImageView* bombImage;
}

@property (retain) IBOutlet TabView* viewer;
@property (strong, nonatomic) IBOutlet UIImageView* bombImage;

- (NSInteger)askNumUsers;

-(void) changeBombStatus:(NSTimer *) timer;
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower;
-(void) circleClicked: (NSInteger) whichCircle withTaps: (NSInteger) numTaps;

@end
