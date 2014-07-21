//
//  ViewController.h
//  PickerView
//
//  Created by shishimo on 2014/05/09.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface ViewController : UIViewController <PickerViewControllerDelegate>
{
}

// 呼び出すPickerViewControllerのポインタ　※strongを指定してポインタを掴んでおかないと解放されてしまう
@property (strong, nonatomic) PickerViewController *pickerViewController;

@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)pushSelectButton:(id)sender;

@end
