//
//  ViewController.h
//  Geo
//
//  Created by shishimo on 2014/10/05.
//  Copyright (c) 2014年 shishimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) CLLocationManager *locationManager;

@end

