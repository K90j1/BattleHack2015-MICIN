//
// Apache License, Version 2.0
// Copyright (c) 2015 routeflags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>

@import CoreLocation;
@import AudioToolbox;

@interface FirstView : UITableViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) NSUUID *proximityUUID;
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) CLBeaconRegion *region;
@property (nonatomic) Boolean *exit;
@property(nonatomic, strong) NSString *beaconUUID;
@end
