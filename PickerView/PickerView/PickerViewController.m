//
//  PickerViewController.m
//  PickerView
//
//  Created by shishimo on 2014/05/24.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // PickerViewのデリゲート先とデータソースをこのクラスに設定
    self.picker.delegate   = self;
    self.picker.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 空の領域にある透明なボタンがタップされたときに呼び出されるメソッド
- (IBAction)pushCloseButton:(id)sender
{
    // PickerViewを閉じるための処理を呼び出す
    [self.delegate closePickerView:self];
}

// PickerViewの列数を指定するメソッド
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;
}

// PickerViewに表示する行数を指定するメソッド
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

// PickerViewの各行に表示する文字列を指定するメソッド
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)row];
}

// PickerViewで要素が選択されたときに呼び出されるメソッド
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // デリゲート先の処理を呼び出し、選択された文字列を親Viewに表示させる
    [self.delegate applySelectedString:[NSString stringWithFormat:@"%ld", (long)row]];
}

@end
