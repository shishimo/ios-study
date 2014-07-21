//
//  ViewController.m
//  WebView
//
//  Created by shishimo on 2014/05/05.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    
    NSMutableString *url = [[NSMutableString alloc] initWithString:@"http://www.yahoo.co.jp"];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    // リクエストを投げる
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
