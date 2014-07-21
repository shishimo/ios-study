//
//  ViewController.h
//  Keyboard
//
//  Created by shishimo on 2014/06/01.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end