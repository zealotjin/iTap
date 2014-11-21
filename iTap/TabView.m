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
}


@end
