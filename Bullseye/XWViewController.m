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
int _score;
int _round;

- (void)viewDidLoad
{
  [super viewDidLoad];
	[self startNewGame];
  [self updateLabels];
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
  int difference = abs(_targetValue - _currentValue);
  int points = 100 - difference;
  _score += points;
  
  NSString *title;
  if (difference == 0) {
    title = @"Perfect!";
    points += 100;
  } else if (difference < 5) {
    title = @"You almost had it!";
    if (difference == 1) {
      points += 50;
    }
  } else if (difference < 10) {
    title = @"Pretty good!";
  } else {
    title = @"Not even close...";
  }
  
  _score += points;
  
  NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [alertView show];
  // [self startNewRound];
  [self updateLabels];
}

- (IBAction)startOver:(id)sender {
  [self startNewGame];
  [self updateLabels];
}

- (void)startNewGame
{
  _score = 0;
  _round = 0;
  [self startNewRound];
}

- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  [self startNewRound];
  [self updateLabels];
}

- (void)startNewRound
{
  _round += 1;
  _targetValue = 1 + arc4random_uniform(100);
  _currentValue = 1;
  _slider.value = _currentValue;
}

- (void)updateLabels
{
  self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
  self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
  self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

@end
