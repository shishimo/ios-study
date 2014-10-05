//
//  ViewController.m
//  Geo
//
//  Created by shishimo on 2014/10/05.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    locationManager = [[CLLocationManager alloc] init];

    // 位置情報サービスが利用できるかどうかをチェック
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager.delegate = self; // ……【1】
        locationManager.pausesLocationUpdatesAutomatically = NO;
        
        NSLog(@"測位開始");
        // 測位開始
        [locationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services not available.");
    }
}

// 位置情報更新時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    //緯度・経度を出力
    NSLog(@"didUpdateToLocation latitude=%f, longitude=%f",
          [newLocation coordinate].latitude,
          [newLocation coordinate].longitude);
}

// 測位失敗時や、5位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
}

// CLLocationManager オブジェクトにデリゲートオブジェクトを設定すると初回に呼ばれる
- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:       // まだ決めていない時
            //[manager requestAlwaysAuthorization];       // iOS8から
            [manager requestWhenInUseAuthorization];    // iOS8から
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse: // アプリ利用中だけ
        case kCLAuthorizationStatusAuthorizedAlways:    // 常に
        case kCLAuthorizationStatusRestricted:          // 設定 > 一般 > 機能制限で利用が制限されている
        case kCLAuthorizationStatusDenied:              // ユーザーがこのアプリでの位置情報サービスへのアクセスを許可していない
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end