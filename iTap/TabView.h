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
}

@property (retain) IBOutlet GameController* gameController;

- (void)draw3Circles;
- (void)draw4Circles;
@end
