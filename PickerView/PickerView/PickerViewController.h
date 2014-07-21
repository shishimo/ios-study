//
//  PickerViewController.h
//  PickerView
//
//  Created by shishimo on 2014/05/24.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewControllerDelegate;

@interface PickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

// 処理のデリゲート先の参照
@property (weak, nonatomic) id<PickerViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)pushCloseButton:(id)sender;

@end

@protocol PickerViewControllerDelegate <NSObject>

// 選択された文字列を適用するためのデリゲートメソッド
-(void)applySelectedString:(NSString *)str;

// 当該PickerViewを閉じるためのデリゲートメソッド
-(void)closePickerView:(PickerViewController *)controller;

@end