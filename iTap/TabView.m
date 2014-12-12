//
//  TabView.m
//  iTap
//
//  Created by June Woo Suk on 11/20/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "TabView.h"
#import "GameController.h"

@implementation TabView

@synthesize gameController;

//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self != nil) {
//        
//    }
//    return self;
//}

- (void)awakeFromNib
{
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:gameController action:@selector(handleSingleTap)];
    singleTap.delegate = gameController;
    singleTap.numberOfTapsRequired = 1;
    //        singleTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer: singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:gameController action:@selector(handleSingleTap)];
    doubleTap.delegate = gameController;
    doubleTap.numberOfTapsRequired = 2;
    //        doubleTap.numberOfTouchesRequired = 2;
    [self addGestureRecognizer: doubleTap];
    
    UITapGestureRecognizer* tripleTap = [[UITapGestureRecognizer alloc] initWithTarget:gameController action:@selector(handleSingleTap)];
    tripleTap.delegate = gameController;
    tripleTap.numberOfTapsRequired = 3;
    //        tripleTap.numberOfTouchesRequired = 3;
    [self addGestureRecognizer: tripleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [singleTap requireGestureRecognizerToFail:tripleTap];
    [doubleTap requireGestureRecognizerToFail:tripleTap];
}

- (void)drawRect:(CGRect)dirtyRect
{
    NSLog(@"draw rect called");
    NSInteger num = [gameController askNumUsers];
    if ([gameController askNumUsers] == 3) {
        [self draw3Circles];
        UILabel* firstPlayer = [[UILabel alloc]initWithFrame:CGRectMake(130,90,100,100)];
        UILabel* secondPlayer = [[UILabel alloc]initWithFrame:CGRectMake(50,380,100,100)];
        UILabel* thirdPlayer = [[UILabel alloc]initWithFrame:CGRectMake(210,380,100,100)];        [firstPlayer setText:@"Player 1"];
        [secondPlayer setText:@"Player 2"];
        [thirdPlayer setText:@"Player 3"];
        [self addSubview:firstPlayer];
        [self addSubview:secondPlayer];
        [self addSubview:thirdPlayer];
    }
    else {
        [self draw4Circles];
        UILabel* firstPlayer = [[UILabel alloc]initWithFrame:CGRectMake(50,100,100,100)];
        UILabel* secondPlayer = [[UILabel alloc]initWithFrame:CGRectMake(50,380,100,100)];
        UILabel* thirdPlayer = [[UILabel alloc]initWithFrame:CGRectMake(210,380,100,100)];
        UILabel* fourthPlayer = [[UILabel alloc]initWithFrame:CGRectMake(210,100,100,100)];
        [firstPlayer setText:@"Player 1"];
        [secondPlayer setText:@"Player 2"];
        [thirdPlayer setText:@"Player 3"];
        [fourthPlayer setText:@"Player 4"];
        [self addSubview:firstPlayer];
        [self addSubview:secondPlayer];
        [self addSubview:thirdPlayer];
        [self addSubview:fourthPlayer];
        
    }

    
    
}

- (void)draw3Circles
{
    CGRect boundsRect0 = CGRectMake(110,90, 100,100);
    UIBezierPath* circlePath0 = [UIBezierPath bezierPathWithOvalInRect: boundsRect0];
    
    [circlePath0 setLineWidth:(CGFloat)4.0];
//    [circlePath0 fill];
    [circlePath0 stroke];
    
    CGRect boundsRect1 = CGRectMake(30,380, 100,100);
    UIBezierPath* circlePath1 = [UIBezierPath bezierPathWithOvalInRect: boundsRect1];
    
    [circlePath1 setLineWidth:(CGFloat)4.0];
//    [circlePath1 fill];
    [circlePath1 stroke];
    
    CGRect boundsRect2 = CGRectMake(190, 380, 100,100);
    UIBezierPath* circlePath2 = [UIBezierPath bezierPathWithOvalInRect: boundsRect2];
    
    [circlePath2 setLineWidth:(CGFloat)4.0];
//    [circlePath2 fill];
    [circlePath2 stroke];
    
    circles = @[circlePath0, circlePath1, circlePath2];
}

- (void)draw4Circles
{
    CGRect boundsRect0 = CGRectMake(30, 100, 100,100);
    UIBezierPath* circlePath0 = [UIBezierPath bezierPathWithOvalInRect: boundsRect0];
    
    [circlePath0 setLineWidth:(CGFloat)4.0];
//    [circlePath0 fill];
    [circlePath0 stroke];
    
    CGRect boundsRect1 = CGRectMake(30,380, 100,100);
    UIBezierPath* circlePath1 = [UIBezierPath bezierPathWithOvalInRect: boundsRect1];
    
    [circlePath1 setLineWidth:(CGFloat)4.0];
//    [circlePath1 fill];
    [circlePath1 stroke];
    
    CGRect boundsRect2 = CGRectMake(190, 100, 100,100);
    UIBezierPath* circlePath2 = [UIBezierPath bezierPathWithOvalInRect: boundsRect2];
    
    [circlePath2 setLineWidth:(CGFloat)4.0];
//    [circlePath2 fill];
    [circlePath2 stroke];
    
    CGRect boundsRect3 = CGRectMake(190, 380, 100,100);
    UIBezierPath* circlePath3 = [UIBezierPath bezierPathWithOvalInRect: boundsRect3];
    
    [circlePath3 setLineWidth:(CGFloat)4.0];
//    [circlePath3 fill];
    [circlePath3 stroke];
    
    circles = @[circlePath0, circlePath1, circlePath3, circlePath2];
}

- (NSArray*) getCircles {
//    NSLog(@"view circles %@", circles);
    return circles;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [NSObject cancelPreviousPerformRequestsWithTarget:self
//                                             selector:@selector(handleSingleTap)
//                                               object:nil];
//    
//    [NSObject cancelPreviousPerformRequestsWithTarget:self
//                                             selector:@selector(handleDoubleTap)
//                                               object:nil];
//}

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//
////    UITouch *touch = touches.anyObject;
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint location = [touch locationInView:self];
//    finalTapCount = 0;
//    circleTap = 0;
//    for (UIBezierPath* circ in circles) {
//        if ([circ containsPoint:location]) {
//            if(touches.count == 1)
//            {
//                if([[touches anyObject] tapCount] == 2)
//                {
//                    NSLog(@"touched twice... getting hot");
//                    [self performSelector:@selector(handleDoubleTap)
//                               withObject:nil
//                               afterDelay:0.35];
//                    finalTapCount = 2;
//                }
//                else if([[touches anyObject] tapCount] == 3)
//                {
//                    NSLog(@"sexy time ");
//                    [self handleTripleTap];
//                    finalTapCount = 3;
//                }
//                else
//                {
//                    [self performSelector:@selector(handleSingleTap)
//                               withObject:nil
//                               afterDelay:0.35];
//                    finalTapCount = 1;
//                }
//            }
//            
//            circleTap = [circles indexOfObject:circ];
//            NSLog(@"The circle: %zd was tapped %zd times", circleTap, finalTapCount);
//
//        }
//    [gameController circleClicked:circleTap withTaps:finalTapCount];
//    }
//}


@end
