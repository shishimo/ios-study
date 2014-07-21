//
//  ViewController.m
//  animation
//
//  Created by shishimo on 2014/05/31.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"

NSUInteger i = 1;

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushStartButton:(id)sender
{
    /*
    [UIView animateWithDuration:1.0f
                     animations:^{
                         // アニメーションをする処理
                         // ビューをx方向に10px，y方向に0px移動
                         // スタートすると少し左にずれてからアニメーションが始まる
                         self.imageView.transform = CGAffineTransformMakeTranslation(10, 0);
                     }
                     completion:^(BOOL finished){
                         // アニメーションが終わった後実行する処理
                     }];
     */
    
    /*
    self.imageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    NSLog(@"Layer: %lf %lf", self.imageView.layer.position.x, self.imageView.layer.position.y);
    NSLog(@"Frame: %lf %lf", self.imageView.frame.origin.x, self.imageView.frame.origin.y);
    
    self.imageView.frame = CGRectMake(0, 20, 320, 320);
    NSLog(@"Layer: %lf %lf", self.imageView.layer.position.x, self.imageView.layer.position.y);
    NSLog(@"Frame: %lf %lf", self.imageView.frame.origin.x, self.imageView.frame.origin.y);
    */

    [UIView beginAnimations:nil context:nil];  // 条件指定開始
    [UIView setAnimationDuration:1.0f];  // 2秒かけてアニメーションを終了させる
    [UIView setAnimationDelay:0.0];  // 3秒後にアニメーションを開始する
    [UIView setAnimationRepeatCount:1.0];  // アニメーションを5回繰り返す
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];  // アニメーションは一定速度
    
    // self.imageView.frame = CGRectMake(320, 20, 320, 320);
    // self.imageView.transform = CGAffineTransformMakeRotation(M_PI * 90 / 180.0);
    
    // CGAffineTransform translate = CGAffineTransformMakeTranslation(320, 0);
    // [self.imageView setTransform:translate];
    
    
    // ビューをx方向に320px，y方向に0px移動
    NSLog(@"Layer: %lf %lf", self.imageView.layer.position.x, self.imageView.layer.position.y);
    NSLog(@"Anchor: %lf %lf", self.imageView.layer.anchorPoint.x, self.imageView.layer.anchorPoint.y);
    CGAffineTransform t = CGAffineTransformMakeTranslation(100, 0);
    
    // ビューを45度回転
    // float angle = 90 * (i%4) * M_PI / 180;
    // CGAffineTransform t = CGAffineTransformMakeRotation(angle);
    
    // ビューにアフィン変換をセット
    self.imageView.transform = t;
    
    [UIView commitAnimations];  // アニメーション開始！
    
    i++;
}
@end
