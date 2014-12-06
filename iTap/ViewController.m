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
    selectedLevel = (NSInteger)EasyLevel;
    selectedPlayer = [_player[0] integerValue];
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
    if(pickerView.tag == 1){    //player
        switch(row){
            case 0:
                NSLog(@"one is selected");
                selectedPlayer = [_player[0] integerValue];
                break;
            case 1:
                NSLog(@"two is selected");
                selectedPlayer = [_player[1] integerValue];
                break;
            case 2:
                NSLog(@"three is selected");
                selectedPlayer = [_player[2] integerValue];
                break;
        }
    
    }else{
        switch(row){    //level
            case 0:
                NSLog(@"one is selected");
                selectedLevel = (NSInteger)EasyLevel;
                break;
            case 1:
                NSLog(@"two is selected");
                selectedLevel = (NSInteger)MediumLevel;
                break;
            case 2:
                NSLog(@"three is selected");
                selectedLevel = (NSInteger)MasterLevel;
                break;
        }
    }
}
-(IBAction)onStartClick:(UIButton*) sender{
    NSLog(@"Button clicked");
    NSLog(@"Selected level: %zd, Selected Player: %zd", selectedLevel, selectedPlayer);
    GameModel* gameModel = [GameModel getGameModel];
    //initialize num users, time, difficulty
}


@end
