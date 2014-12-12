//
//  GameController.m
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "GameController.h"
#import "BombModel.h"


@implementation GameController

@synthesize viewer;
@synthesize bombImage;
@synthesize replayButton;
@synthesize backButton;
@synthesize result;
@synthesize taps;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    gameModel = [GameModel getGameModel];

    replayButton.hidden = YES;
    backButton.hidden = YES;
    
    bomb = [[BombModel alloc] initWithDifficulty: 0];
    gameTerminated = NO;
    UIImage* image = [UIImage imageNamed: @"status0.jpg"];
    [bombImage setImage: image];

    //specifiying lower and upper Time bound
    
    
    //==============need to get from gamemodel===============
    lowerTimeBound = 5;
    upperTimeBound = 10;
    //==============need to get from gamemodel===============

    
}
-(void)handleSingleTap{
    NSArray* circles = [self.viewer getCircles];
    NSInteger touchCount = touches.tapCount;
    CGPoint location = touchPoint;
    finalTapCount = 0;
    circleTap = 0;
    
    for (UIBezierPath* circ in circles) {
        if ([circ containsPoint:location]) {
            if(touchCount > 0)
            {
                if(touchCount == 2)
                {
                    NSLog(@"touched twice... getting hot");
                    finalTapCount = 2;
                }
                else if(touchCount == 3)
                {
                    NSLog(@"sexy time ");
                    finalTapCount = 3;
                }
                else
                {
                    NSLog(@"touch once");
                    finalTapCount = 1;
                }
                circleTap = [circles indexOfObject:circ];
                NSLog(@"The circle: %zd touch %zd times", circleTap,finalTapCount);
                [self circleClicked:circleTap withTaps:finalTapCount];
                taps.text = [NSString stringWithFormat:@"%zd", finalTapCount];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//This method creates a new BombTimer with Randomtime of range specified upper and lower
//And set bombStatus as 0.


//changeBombStatus function changes bombStatus and assignes new timeInterval to the bombTimer for the remaining stages.
//For the next stages 1,2,3 indicated by bombStatus has specific time intervals.

-(void) changeBombStatus:(NSTimer *) timer{
    //if bombStatus is 3(exploded) timer terminates.
    UIImage* image;
    NSTimeInterval newTime = 0;
    bombStatus++;
    
    if(bombStatus ==4){
        [self explodeBomb: bombTimer];
    }else{
        switch(bombStatus){
            case 1:
                
                image = [UIImage imageNamed: @"status1.jpeg"];
                newTime = 10;
                break;
            case 2:
                
                image = [UIImage imageNamed: @"status2.jpeg"];
                newTime = 5;
                break;
            case 3:
                
                image = [UIImage imageNamed: @"status3.jpeg"];
                newTime = 2;
                break;
        }
        if(gameTerminated == NO){
            NSLog(@"bombTimer has been changed!");
            [bombImage setImage: image];
            bombTimer = [NSTimer scheduledTimerWithTimeInterval: newTime
                                                     target:self
                                                   selector:@selector(changeBombStatus:)
                                                   userInfo:nil
                                                    repeats:NO];
        }else{
            NSLog(@"Bomb force end");
            [bombTimer invalidate];
        }
    }
}

-(void) explodeBomb: (NSTimer *) timer{
    NSLog(@"-------------Bomb Exploded-----------------");
    UIImage* image;
    image = [UIImage imageNamed: @"status4.jpg"];
    NSInteger loser = [gameModel getNextTurn]+1;
    result.text = [NSString stringWithFormat:@"The player %zd LOST", loser];
    taps.text = @"Taps";
    [bombImage setImage: image];
    [bombTimer invalidate];
    [userTimer invalidate];
    bombStatus = 4;
    [self terminateGame];

}
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower{
    bombStatus = 0;
    NSTimeInterval randomTime = lower + arc4random() % (upper - lower);
    if(gameTerminated == NO){
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:randomTime
                                                          target:self
                                                        selector:@selector(changeBombStatus:)
                                                        userInfo:nil
                                                         repeats:NO];
        return timer;
    }
    return nil;
}

-(NSTimer*) getUserTimerWithTime: (NSInteger) time{
    if(!gameTerminated){
        NSLog(@"**********Got user Time*************");
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval) time
                                                      target:self
                                                        selector:@selector(userTimerDone:)
                                                    userInfo:nil
                                                     repeats:NO];
        //clickedFirst = NO;
        return timer;
    }else{
        return nil;
    }
}

-(void) resetUserTimer: (NSTimer*) timer{
    if(!gameTerminated){
        NSLog(@"**********RESET USER Time*************");
        userTimer =  [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval) userTime
                                                          target:self
                                              selector:@selector(userTimerDone:)
                                                        userInfo:nil
                                                         repeats:NO];

    }else{
        [self userTimerDone: userTimer];
    }

}





    
-(void) userTimerDone:(NSTimer *) timer{
    NSLog(@"-------------User Timer Done-----------------");
    UIImage* image;
    image = [UIImage imageNamed: @"loser.jpg"];
    [bombImage setImage: image];
    [userTimer invalidate];
    bombTimer = nil;
    NSInteger loser = [gameModel getNextTurn]+1;
    result.text = [NSString stringWithFormat:@"The player %zd LOST", loser];
    taps.text = @"Taps";
    [self terminateGame];
    bombStatus = 0;
    
}


-(void) terminateGame{
    NSLog(@"-------------TERMINATED-----------------");
    gameTerminated = YES;
    replayButton.hidden = NO;
    backButton.hidden = NO;
  
}




- (NSInteger) askNumUsers {
    NSLog(@"GameController getNumUsers: %zd", [gameModel getNumUsers]);
    return [gameModel getNumUsers];
}


-(void) circleClicked: (NSInteger) whichCircle withTaps: (NSInteger) numTaps{
    NSLog(@"From the game controller got information %zd, %zd", whichCircle, numTaps);
    if( [gameModel getNextTurn] == -1 && gameTerminated == NO){
        // this is the very beginning
        // start the bomb timer
        //generates radomTime using lower and upper time bound
        //specifiying lower and upper Time bound
        bombTimer = [self getBombTimerWithUpperTimeBound: upperTimeBound andLowerTimeBound:lowerTimeBound];
        //userTimer setup
        userTime = [gameModel getUserTime];
        userTimer = [self getUserTimerWithTime: userTime];
        NSLog(@"Start the game!");
        [gameModel calculateNextUser:whichCircle withNumTaps:numTaps];
    }else{
        if([gameModel validate:whichCircle withTap:numTaps] && gameTerminated == NO){
            [userTimer invalidate];
            [self resetUserTimer:userTimer];
            NSLog(@"RESET USER TIMER");
            
        }else{
            NSLog(@"Wrong");
            //end the game because wrong move
            //the loser is the person with whichCircle
            NSLog(@"WRONG MOVE!!!!!");
            taps.text = @"Taps";
            [self userTimerDone: userTimer];
            NSInteger next = [gameModel getNextTurn]+1;
            NSInteger clicked = whichCircle + 1;
            result.text = [NSString stringWithFormat:@"The players: %zd and %zd LOST", clicked, next];
            gameTerminated = YES;
        }
    }
}

-(IBAction)replayButtonClicked:(UIButton*)sender{
    NSLog(@"replay Button clicked");
    [gameModel initialize];
    [bombTimer invalidate];
    [userTimer invalidate];
    taps.text = @"Taps";
     UIImage* image = [UIImage imageNamed: @"status0.jpg"];
    [bombImage setImage: image];
    result.text = @"";
    bombStatus = 0;
    gameTerminated = NO;
    replayButton.hidden = YES;
    backButton.hidden = YES;

}
       





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    touches = touch;
    touchPoint = [touch locationInView:self.view];
    return YES;
}

- (void)dealloc
{
    for (UIGestureRecognizer *recognizer in self.view.gestureRecognizers)
    {
        recognizer.delegate = nil;
        [recognizer removeTarget:self action:NULL];
    }
}

@end
