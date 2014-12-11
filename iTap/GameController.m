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

@synthesize view;
@synthesize bombImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    gameModel = [GameModel getGameModel];
    NSLog(@"The gameModel: %ld",(long)[gameModel getTime]);
    // Do any additional setup after loading the view.

    
    //creates a bomb with difficulty of 0
    
    
    bomb = [[BombModel alloc] initWithDifficulty: 0];

    //specifiying lower and upper Time bound
    lowerTimeBound = 5;
    upperTimeBound = 10;
    
    //generates radomTime using lower and upper time bound
    
    bombTimer = [self getBombTimerWithUpperTimeBound: upperTimeBound andLowerTimeBound:lowerTimeBound];
    
    UIImage* image = [UIImage imageNamed: @"status0.jpg"];
    [bombImage setImage: image];
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer: singleTap];
    
    // 2 fingers pinch
    UIPinchGestureRecognizer* doubleMove = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleMove:)];
    
    [self.view addGestureRecognizer: doubleMove];
    CGPoint location = [singleTap locationInView:singleTap.view];
    NSArray* circles = [view getCircles];
    NSLog(@"circles %@", circles);
    for (UIBezierPath* circ in circles) {
        if ([circ containsPoint:location]) {
            NSLog(@"asdfasdfasdfasdf");
        }
    }
}
-(void)handleSingleTap{
    NSLog(@"Single Tap working");
    
    
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
    if(bombStatus == 3){
        bombStatus++;
        NSLog(@"assadfasf");
        image = [UIImage imageNamed: @"status4.jpg"];
        [bombImage setImage: image];
        [timer invalidate];
    }else{
        bombStatus++;
        NSInteger currState = bombStatus;
        switch(currState){
            case 1:
                image = [UIImage imageNamed: @"status1.jpeg"];
                NSLog(@"10sec");
                [bombImage setImage: image];
                timer = [NSTimer scheduledTimerWithTimeInterval: 10
                                                         target:self
                                                       selector:@selector(changeBombStatus:)
                                                       userInfo:nil
                                                        repeats:NO];
                break;
            case 2:
                NSLog(@"5sec");
                image = [UIImage imageNamed: @"status2.jpeg"];
                [bombImage setImage: image];
                timer = [NSTimer scheduledTimerWithTimeInterval: 5
                                                         target:self
                                                       selector:@selector(changeBombStatus:)
                                                       userInfo:nil
                                                        repeats:NO];
                break;
            case 3:
                NSLog(@"2sec");
                image = [UIImage imageNamed: @"status3.jpeg"];
                [bombImage setImage: image];
                timer = [NSTimer scheduledTimerWithTimeInterval: 2
                                                         target:self
                                                       selector:@selector(changeBombStatus:)
                                                       userInfo:nil
                                                        repeats:NO];
                break;
                
        }
        
    }
}
-(NSTimer*) getBombTimerWithUpperTimeBound:(NSInteger) upper andLowerTimeBound:(NSInteger) lower{
    
    bombStatus = 0;
    NSTimeInterval randomTime = lower + arc4random() % (upper - lower);
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:randomTime
                                                      target:self
                                                    selector:@selector(changeBombStatus:)
                                                    userInfo:nil
                                                     repeats:NO];
    return timer;
    
    
    
}


- (NSInteger) askNumUsers {
    NSLog(@"GameController getNumUsers: %zd", [gameModel getNumUsers]);
    return [gameModel getNumUsers];
}


-(void) circleClicked: (NSInteger) whichCircle withTaps: (NSInteger) numTaps{
    NSLog(@"From the game controller got information %zd, %zd", whichCircle, numTaps);
    if( [gameModel getNextTurn] == -1){
        // this is the very beginning
        
        //+++++++++++++++ start the bomb timer
        
        NSLog(@"Start the game!");
        [gameModel calculateNextUser:whichCircle withNumTaps:numTaps];
        
        //+++++++++++++++need to start user timer
    }else{
        if([gameModel validate:whichCircle withTap:numTaps]){
            //correct
            NSLog(@"Correct");
            //++++++++++++++++++reset the user timer
            
        }else{
            NSLog(@"Wrong");
            //end the game because wrong move
            //the loser is the person with whichCircle
            
        }
       
    }
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
