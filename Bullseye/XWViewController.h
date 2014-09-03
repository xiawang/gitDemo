//
//  XWViewController.h
//  Bullseye
//
//  Created by 王小天 on 14-9-3.
//  Copyright (c) 2014年 Wang Xiaotian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;

- (IBAction)sliderMoved:(UISlider *)sender;
- (IBAction)showAlert:(UIButton *)sender;

@end
