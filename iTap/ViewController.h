//
//  ViewController.h
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *_level;
    NSArray *_player;
}

@property (strong, nonatomic) IBOutlet UIPickerView* levelPicker;
@property (strong, nonatomic) IBOutlet UIPickerView* playerPicker;
@property (strong, nonatomic) IBOutlet UISlider* slider;

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;

@end

