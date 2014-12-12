//
//  TabView.h
//  iTap
//
//  Created by June Woo Suk on 11/20/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameController;

@interface TabView : UIView {
    NSArray *circles;
    IBOutlet GameController* gameController;
//    GameController* gameController;
    NSInteger finalTapCount;
    NSInteger circleTap;
    
}

@property (retain) IBOutlet GameController* gameController;

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;


- (void)draw3Circles;
- (void)draw4Circles;
- (NSArray*)getCircles;
@end
