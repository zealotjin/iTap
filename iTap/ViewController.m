//
//  ViewController.m
//  iTap
//
//  Created by JinGeun Lee on 11/8/14.
//  Copyright (c) 2014 KJJ Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _level = @[@"Easy", @"Medium", @"Master"];
    _player = @[@"3", @"4", @"5"];
    
    self.levelPicker.delegate=self;
    self.playerPicker.delegate=self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return _player.count;
    }
    else {
        return _level.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return _player[row];
    }
    else {
        return _level[row];
    }
}
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
 
}
-(IBAction)onStartClick:(UIButton*) sender{
    NSLog(@"Button clicked");
    
    NSInteger selectedLevel = [_levelPicker selectedRowInComponent:0];
    NSInteger selectedPlayer = [_playerPicker selectedRowInComponent:0];
    NSLog(@"Selected level: %zd, Selected Player: %zd", selectedLevel, selectedPlayer);
}


@end
