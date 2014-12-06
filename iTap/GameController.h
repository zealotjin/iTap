//
//  GameController.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TabView.h"
#import "GameModel.h"

@class TabView;

@interface GameController : UIViewController
{
    TabView* view;
    GameModel* gameModel;
}

//@property (retain) IBOutlet TabView* view;

- (NSInteger)askNumUsers;


@end
