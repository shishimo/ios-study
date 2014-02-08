//
//  ViewController.m
//  UIScrollView
//
//  Created by Shimoda Shinichiro on 2014/02/08.
//  Copyright (c) 2014年 Shimoda Shinichiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    NSUInteger currentPage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // UIScrollViewのインスタンス化
    // 画面と同サイズ
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    // UIScrollViewの基本設定
    scrollView.bounces = YES;
    scrollView.userInteractionEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    /**
     * UIScrollViewのコンテンツとして３枚の画像を設置する
     */
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        self.view.bounds.size.width,
                                                                        self.view.bounds.size.height)];
    image1.image = [UIImage imageNamed:@"page1"];
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width,
                                                                        0,
                                                                        self.view.bounds.size.width,
                                                                        self.view.bounds.size.height)];
    image2.image = [UIImage imageNamed:@"page2"];
    
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 2,
                                                                        0,
                                                                        self.view.bounds.size.width,
                                                                        self.view.bounds.size.height)];
    image3.image = [UIImage imageNamed:@"page3"];
    
    [scrollView addSubview:image1];
    [scrollView addSubview:image2];
    [scrollView addSubview:image3];
    
    // UIScrollViewのコンテンツサイズを画像のサイズに合わせる
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
    
    // スクロールビューを追加
    [self.view addSubview:scrollView];
    
    // ページコントロールのインスタンス化
    CGFloat x = (self.view.bounds.size.width - 300) / 2;
    CGFloat y = self.view.bounds.size.height - 65;
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, 300, 50)];
    
    // 背景色を設定
    // 背景色を設定しなければ透過になる
    // pageControl.backgroundColor = [UIColor blackColor];
    
    // ページ数を設定
    pageControl.numberOfPages = 3;
    
    // 現在のページを設定
    pageControl.currentPage = 0;
    
    // ページコントロールを貼付ける
    [self.view addSubview:pageControl];
    
    // 現在のページ番号の設定
    currentPage = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate methods

// スクロールビューがスワイプされたとき
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    if ((NSInteger)fmod(scrollView.contentOffset.x, pageWidth) == 0) {
        // ページコントロールに現在のページを設定
        pageControl.currentPage = scrollView.contentOffset.x / pageWidth;
    }
}

// スクロールが止まったとき
- (void)scrollViewDidEndDecelerating:(UIScrollView*)_scrollView
{
    // 移動幅が足りなくて元のページに戻ることがあるので、
    // スクロールが行われページが切り替わったかどうかの判定
    
    NSUInteger page = (NSUInteger)(scrollView.contentOffset.x / scrollView.frame.size.width);
    
    // あらかじめ保存しておいたページ番号と照らし合わせます。
    if (currentPage != page)
    {
        // 現在のページ番号を更新します。
        currentPage = page;
        
        // ここでページが変わったときの処理を行います。
        NSLog(@"%luにページが変更されました", currentPage);
    } else {
        NSLog(@"ページは変更されませんでした");
    }
}
@end
