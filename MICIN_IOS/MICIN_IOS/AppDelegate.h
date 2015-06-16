//
//  AppDelegate.h
//  MICIN_IOS
//
//  Apache License, Version 2.0
//  Copyright (c) 2015 routeflags. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import AVFoundation;

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate> {
    UIViewController *rootFirstViewInstance;
}

@property(strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSUUID *proximityUUID;
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) CLBeaconRegion *region;

@end

