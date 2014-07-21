//
//  ViewController.h
//  animation
//
//  Created by shishimo on 2014/05/31.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)pushStartButton:(id)sender;
@end
