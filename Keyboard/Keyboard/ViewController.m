//
//  ViewController.m
//  Keyboard
//
//  Created by shishimo on 2014/06/01.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController {
    BOOL observing;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.textField.delegate = self;
    

    // ツールバーの作成
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque; // スタイルを設定
    [toolBar sizeToFit];
    
    // フレキシブルスペースの作成（Doneボタンを右端に配置したいため）
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    // Doneボタンの作成
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeKeyboard:)];
    
    // ボタンをToolbarに設定
    NSArray *items = [NSArray arrayWithObjects:spacer, done, nil];
    [toolBar setItems:items animated:YES];
    
    // ToolbarをUITextFieldのinputAccessoryViewに設定
    self.textField.inputAccessoryView = self.toolbar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeKeyboard:(id)sender{
	[self.textField resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
    // super
    [super viewWillAppear:animated];

    // Start observing
    if (!observing) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(keyboardWillShow:)
                       name:UIKeyboardWillShowNotification
                     object:nil];
        /*
        [center addObserver:self
                   selector:@selector(keybaordWillHide:)
                       name:UIKeyboardWillHideNotification
                     object:nil];
         */
        observing = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{

    // super
    [super viewWillDisappear:animated];
    
    // Stop observing
    if (observing) {
        NSNotificationCenter *center;
        center = [NSNotificationCenter defaultCenter];
        [center removeObserver:self
                          name:UIKeyboardWillShowNotification
                        object:nil];
        /*
        [center removeObserver:self
                          name:UIKeyboardWillHideNotification
                        object:nil];
        */
        observing = NO;
    }
}

-(void)keyboardWillShow:(NSNotification*)note
{
    NSLog(@"Keyboard will show");

        /*
    // キーボードの表示完了時の場所と大きさを取得。
    CGRect keyboardFrameEnd = [[note.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float screenHeight = screenBounds.size.height;
    
    if((self.textField.frame.origin.y + self.textField.frame.size.height)>(screenHeight - keyboardFrameEnd.size.height)){
    	// テキストフィールドがキーボードで隠れるようなら
        // 選択中のテキストフィールドの直ぐ下にキーボードの上端が付くように、スクロールビューの位置を上げる
        [UIView animateWithDuration:0.22f
                         animations:^{
                             self.textField.frame = CGRectMake(0, screenHeight - self.textField.frame.size.height - keyboardFrameEnd.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
                             NSLog(@"Screen Height: %lf", screenHeight);
                             NSLog(@"Text: %lf %lf %lf %lf", self.textField.frame.origin.x, self.textField.frame.origin.y, self.textField.frame.size.width, self.textField.frame.size.height);
                             NSLog(@"Keyboard: %lf %lf %lf %lf", keyboardFrameEnd.origin.x, keyboardFrameEnd.origin.y, keyboardFrameEnd.size.width, keyboardFrameEnd.size.height);
                         }];
 
    }
*/
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
/*
    // viewのy座標を元に戻してキーボードをしまう
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.textField.frame = CGRectMake(0, 322, self.textField.frame.size.width, self.textField.frame.size.height);
                         [self.textField layoutIfNeeded];
                     }];
    
    NSLog(@"Text: %lf %lf %lf %lf", self.textField.frame.origin.x, self.textField.frame.origin.y, self.textField.frame.size.width, self.textField.frame.size.height);
 */
    [textField resignFirstResponder];
    return YES;
}

@end
