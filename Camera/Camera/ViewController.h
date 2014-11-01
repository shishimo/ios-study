//
//  ViewController.h
//  Camera
//
//  Created by shishimo on 2014/11/01.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)pushFilterButton:(id)sender;
- (IBAction)pushSaveButton:(id)sender;
- (IBAction)pushBrendButton:(id)sender;

@end

