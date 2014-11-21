//
//  TabView.m
//  iTap
//
//  Created by June Woo Suk on 11/20/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "TabView.h"

@implementation TabView

- (void)drawRect:(CGRect)dirtyRect
{
    CGRect boundsRect0 = CGRectMake(110,90, 100,100);
    UIBezierPath* circlePath0 = [UIBezierPath bezierPathWithOvalInRect: boundsRect0];
    
    [circlePath0 setLineWidth:(CGFloat)4.0];
    [circlePath0 fill];
    [circlePath0 stroke];
    
    CGRect boundsRect1 = CGRectMake(30,380, 100,100);
    UIBezierPath* circlePath1 = [UIBezierPath bezierPathWithOvalInRect: boundsRect1];
    
    [circlePath1 setLineWidth:(CGFloat)4.0];
    [circlePath1 fill];
    [circlePath1 stroke];
    
    CGRect boundsRect2 = CGRectMake(190, 380, 100,100);
    UIBezierPath* circlePath2 = [UIBezierPath bezierPathWithOvalInRect: boundsRect2];
    
    [circlePath2 setLineWidth:(CGFloat)4.0];
    [circlePath2 fill];
    [circlePath2 stroke];
    
    circles = @[circlePath0, circlePath1, circlePath2];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

//    UITouch *touch = touches.anyObject;
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self];
    
    for (UIBezierPath* circ in circles) {
        if ([circ containsPoint:location]) {
            if(touches.count == 1)
            {
                NSLog(@"touched once... shy");
                if([[touches anyObject] tapCount] == 2)
                {
                    NSLog(@"touched twice... getting hot");
                    //            [self performSelector:@selector(doubleTap)
                    //                       withObject:nil
                    //                       afterDelay:0.35];
                }
                else if([[touches anyObject] tapCount] == 3)
                {
                    NSLog(@"sexy time ");
                    //            [self trippleTap];
                }
                else
                {
                    NSLog(@"hehehehe");
                    //            [self performSelector:@selector(singleTap)
                    //                       withObject:nil
                    //                       afterDelay:0.35];
                }
            }
        }
    }
}


@end
