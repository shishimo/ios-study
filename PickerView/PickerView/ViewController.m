//
//  ViewController.m
//  PickerView
//
//  Created by shishimo on 2014/05/09.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

//#define FIRST_YEAR 1970     // PickerViewの最初の年
//#define LAST_YEAR  2030     // Pickerviewの最後の年

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    self.textView.delegate = self;
    
    // 現在の日付を取得
    NSDate *today = [NSDate date];
    
    // 現在の日付(NSDate)から年と月をintで取得
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:today];
    int todayYear  = components.year;   // 現在の年を取得
    int todayMonth = components.month;  // 現在の月を取得
    
    // ラベルに現在の日付を表示
    self.dateLabel.text = [NSString stringWithFormat:@"西暦%d年%d月", todayYear, todayMonth];
    
    // Pickerviewにデリゲートを設定
    self.pickerView.delegate = self;
    
    // -------------------------------------------
    // PickerViewに表示させるデータの作成
    // -------------------------------------------
    // PickerViewに年部分に表示させる年データの作成 (1970, 1971, ..., 2030)
    years = [[NSMutableArray alloc] initWithCapacity:(LAST_YEAR-FIRST_YEAR)];
    for (int i = FIRST_YEAR; i <= LAST_YEAR; i++) {
        [years addObject:[NSString stringWithFormat:@"%d", i]];
    }
    // PickerViewの月部分に表示させる月データの作成 (1, 2, ..., 12)
    months = [[NSMutableArray alloc] initWithCapacity:12];
    for (int i = 1; i <= 12; i++) {
        [months addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    // -------------------------------------------
    // PickerViewに初期の選択値として、現在の日付を設定
    // -------------------------------------------
    // PickerViewの列数を計算する
    // 列数(row)は0から始まるので注意。例えば、1970年を指定したかったらrowは0, 1971ならrowは1となる
    int rowOfTodayYear  = todayYear  - FIRST_YEAR;    // 年の列数を計算
    int rowOfTodayMonth = todayMonth - 1;             // 月の列数を計算
    // PickerViewの初期の選択値を設定
    // componentが行番号、selectRowが列番号
    [self.pickerView selectRow:rowOfTodayYear inComponent:0 animated:YES];  // 年を選択
    [self.pickerView selectRow:rowOfTodayMonth inComponent:1 animated:YES]; // 月を選択
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 「選択」ボタンがタップされたときに呼び出されるメソッド
- (IBAction)pushSelectButton:(id)sender
{
    // PickerViewControllerのインスタンスをStoryboardから取得し
    self.pickerViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"PickerViewController"];
    
    self.pickerViewController.delegate = self;
    
    // PickerViewをサブビューとして表示する
    // 表示するときはアニメーションをつけて下から上にゆっくり表示させる
    
    // アニメーション完了時のPickerViewの位置を計算
    UIView *pickerView = self.pickerViewController.view;

    
    // アニメーション開始時のPickerViewの位置を計算
    UIWindow* mainWindow = (((AppDelegate*) [UIApplication sharedApplication].delegate).window);
    [mainWindow addSubview:pickerView];
    
    /*
    CGPoint middleCenter = pickerView.center;
    CGSize offSize = [UIScreen mainScreen].bounds.size;
    CGPoint offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
    pickerView.center = offScreenCenter;
    
    // アニメーションを使ってPickerViewをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    pickerView.center = middleCenter;
    [UIView commitAnimations];
    */
}

// PickerViewのある行が選択されたときに呼び出されるPickerViewControllerDelegateプロトコルのデリゲートメソッド
- (void)applySelectedString:(NSString *)str
{
    self.displayLabel.text = str;
}

// PickerViewController上にある透明ボタンがタップされたときに呼び出されるPickerViewControllerDelegateプロトコルのデリゲートメソッド
- (void)closePickerView:(PickerViewController *)controller
{
    // PickerViewをアニメーションを使ってゆっくり非表示にする
    UIView *pickerView = controller.view;
    
    // アニメーション完了時のPickerViewの位置を計算
    CGSize offSize = [UIScreen mainScreen].bounds.size;
    CGPoint offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
    
    [UIView beginAnimations:nil context:(void *)pickerView];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    // アニメーション終了時に呼び出す処理を設定
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    pickerView.center = offScreenCenter;
    [UIView commitAnimations];
}

// 単位のPickerViewを閉じるアニメーションが終了したときに呼び出されるメソッド
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    // PickerViewをサブビューから削除
    UIView *pickerView = (__bridge UIView *)context;
    [pickerView removeFromSuperview];
}
@end
