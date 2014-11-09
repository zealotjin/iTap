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
}

@property (strong, nonatomic) IBOutlet UIPickerView* picker;
@property (strong, nonatomic) NSArray *exchangeRates;
@property (strong, nonatomic) NSArray *countryNames;

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;

@end

