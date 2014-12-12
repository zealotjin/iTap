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

@synthesize bombImage;
@synthesize replayButton;
@synthesize backButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    gameModel = [GameModel getGameModel];
    NSLog(@"The gameModel: %ld",(long)[gameModel getTime]);
    // Do any additional setup after loading the view.
    replayButton.hidden = YES;
    backButton.hidden = YES;
    //clickedFirst = YES;
    
    //creates a bomb with difficulty of 0
    bomb = [[BombModel alloc] initWithDifficulty: 0];
    gameTerminated = NO;
    UIImage* image = [UIImage imageNamed: @"status0.jpg"];
    [bombImage setImage: image];


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
            NSLog(@"Bome force end");
            return;
        }
    }
}

-(void) explodeBomb: (NSTimer *) timer{
    NSLog(@"-------------Bomb Exploded-----------------");
    UIImage* image;
    image = [UIImage imageNamed: @"status4.jpg"];
    [bombImage setImage: image];
    [bombTimer invalidate];
    [userTimer invalidate];
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
    [self terminateGame];
    
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
    if( [gameModel getNextTurn] == nil && gameTerminated == NO){
        // this is the very beginning
        // start the bomb timer
        //generates radomTime using lower and upper time bound
        //specifiying lower and upper Time bound
        lowerTimeBound = 5;
        upperTimeBound = 10;
        //if(){
            bombTimer = [self getBombTimerWithUpperTimeBound: upperTimeBound andLowerTimeBound:lowerTimeBound];
            //userTimer setup
            userTime = [gameModel getUserTime];
            userTimer = [self getUserTimerWithTime: userTime];
            NSLog(@"Start the game!");
        //}
    }else{
        if([gameModel validate:whichCircle withTap:numTaps] && gameTerminated == NO){
            //correct
            //reset the user timer
            [userTimer invalidate];
            [self resetUserTimer:userTimer];
            NSLog(@"RESET USER TIMER");
            
        }else{
            //end the game because wrong move
            //the loser is the person with whichCircle
            NSLog(@"WRONG MOVE!!!!!");
            [self userTimerDone: userTimer];
            
        }
    }
}

-(IBAction)replayButtonClicked:(UIButton*)sender{
    NSLog(@"replay Button clicked");
    [gameModel initialize];
    [bombTimer invalidate];
    [userTimer invalidate];
     UIImage* image = [UIImage imageNamed: @"status0.jpg"];
    [bombImage setImage: image];
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

@end
