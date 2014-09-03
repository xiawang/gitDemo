//
//  XWViewController.m
//  Bullseye
//
//  Created by 王小天 on 14-9-3.
//  Copyright (c) 2014年 Wang Xiaotian. All rights reserved.
//

#import "XWViewController.h"

@interface XWViewController ()

@end

@implementation XWViewController

int _currentValue;
int _targetValue;

- (void)viewDidLoad
{
  [super viewDidLoad];
	_currentValue = _slider.value;
  _targetValue = 1 + arc4random_uniform(100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
  _currentValue = lroundf(sender.value);
}

- (IBAction)showAlert:(UIButton *)sender {
  NSString *message = [NSString stringWithFormat:
                       @"The value of the slider is: %d\nThe target value is: %d",
                       _currentValue, _targetValue];
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello World!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [alertView show];
}

- (void)startNewRound
{
  _targetValue = 1 + arc4random_uniform(100);
  _currentValue = 50;
  self.slider.value = _currentValue;
}

@end
