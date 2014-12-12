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

@interface GameController : UIViewController <UIGestureRecognizerDelegate>
{
    GameModel* gameModel;
    NSInteger lowerTimeBound;
    NSInteger upperTimeBound;
    NSTimer* bombTimer;
    NSInteger bombStatus;
    BombModel *bomb;
    UIImageView* bombImage;
    NSTimer* userTimer;
    NSInteger userTime;
    NSInteger gameTerminated;
    UIButton *replayButton;
    UIButton *backButton;
    BOOL clickedFirst;
    UITouch* touches;
    CGPoint touchPoint;
    
    NSInteger finalTapCount;
    NSInteger circleTap;
}

@property (nonatomic, weak) IBOutlet TabView* viewer;
@property (strong, nonatomic) IBOutlet UIImageView* bombImage;
@property (strong, nonatomic) IBOutlet UIButton* replayButton;
@property (strong, nonatomic) IBOutlet UIButton* backButton;
@property (strong, nonatomic) IBOutlet UILabel* result;
@property (strong, nonatomic) IBOutlet UILabel* taps;

-(IBAction)replayButtonClicked:(UIButton*)sender;

- (NSInteger)askNumUsers;

-(void) changeBombStatus:(NSTimer *) timer;
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower;
-(NSTimer*) getUserTimerWithTIme:(NSInteger) time;
-(void) explodeBomb;
-(void) resetUserTimer:(NSTimer *) timer;
-(void) userTimerDone:(NSTimer *) timer;

-(void) circleClicked: (NSInteger) whichCircle withTaps: (NSInteger) numTaps;
-(void) terminateGame;

-(void)handleSingleTap;
- (NSTimer *)getUserTimerWithTIme:(NSInteger)time;

@end
