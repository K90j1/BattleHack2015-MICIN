//
//  AppDelegate.h
//  MICIN_IOS
//
//  Created by bookair17 on 6/14/15.
//  Copyright (c) 2015 bookair17. All rights reserved.
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
@property (strong, nonatomic) AVAudioPlayer *enter;
@property (strong, nonatomic) AVAudioPlayer *exit;

@end

