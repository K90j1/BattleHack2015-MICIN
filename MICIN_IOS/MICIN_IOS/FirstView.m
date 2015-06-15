//
// Created by bookair17 on 6/14/15.
// Copyright (c) 2015 bookair17. All rights reserved.
//

#import "FirstView.h"
#import "SecondView.h"

@implementation FirstView

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad {

    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top.png"]];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
    self.manager = [CLLocationManager new];
    self.manager.delegate = self;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    [[self.view viewWithTag:1] removeFromSuperview];
}

#pragma mark - Table view data source
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)initializeMonitoring
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.exit = false;
    if ([CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
        // 生成したUUIDからNSUUIDを作成
        self.beaconUUID = @"1E21BCE0-7655-4647-B492-A3F8DE2F9A02";
        self.proximityUUID = [[NSUUID alloc] initWithUUIDString:self.beaconUUID];

        // CLBeaconRegionを作成
        self.region = [[CLBeaconRegion alloc]
                initWithProximityUUID:self.proximityUUID
                           identifier:@"45GXVEBQ63.com.coronet-internet.micin"];
        self.region.notifyOnEntry = YES;
        self.region.notifyOnExit = YES;
        self.region.notifyEntryStateOnDisplay = NO;

        // 領域監視を開始
        [self.manager startMonitoringForRegion:self.region];
        // 距離測定を開始
        [self.manager startRangingBeaconsInRegion:self.region];
    }
}

// Beaconに入ったときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self sendNotification:@"didEnterRegion"];
}

// Beaconから出たときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self sendNotification:@"didExitRegion"];
}

// Beaconとの状態が確定したときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
      didDetermineState:(CLRegionState)state
              forRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    switch (state) {
        case CLRegionStateInside:
            NSLog(@"CLRegionStateInside");
            break;
        case CLRegionStateOutside:
            NSLog(@"CLRegionStateOutside");
            break;
        case CLRegionStateUnknown:
            NSLog(@"CLRegionStateUnknown");
            break;
        default:
            break;
    }
}


- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if(self.exit){
        return;
    }

    CLBeacon *beacon = beacons.firstObject;
    CLProximity proximity = beacon.proximity;
    SecondView *second = [[SecondView alloc] init];
    second.beaconUUID = self.beaconUUID;

    switch (proximity) {
        case CLProximityUnknown:
            break;
        case CLProximityImmediate:
            [self.manager stopMonitoringForRegion:self.region];
            [self.manager stopRangingBeaconsInRegion:self.region];
            [self.navigationController pushViewController:second animated:YES];
            self.exit = true;
            break;
        case CLProximityNear:
//            [self.manager stopMonitoringForRegion:self.region];
//            [self.manager stopRangingBeaconsInRegion:self.region];
//            [self.navigationController pushViewController:second animated:YES];
//            self.exit = true;
            break;
        case CLProximityFar:
            break;
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    UIApplication *application = [UIApplication sharedApplication];
//    [self application:@"CLProximityImmediate"];
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }

    //NSLog(@"%@", NSStringFromSelector(_cmd));
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"kCLAuthorizationStatusNotDetermined");
            if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [self.manager requestWhenInUseAuthorization];
            } else {
                [self initializeMonitoring];
            }
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"kCLAuthorizationStatusRestricted");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"kCLAuthorizationStatusDenied");
            break;
        case kCLAuthorizationStatusAuthorized:
            NSLog(@"kCLAuthorizationStatusAuthorized");
            [self initializeMonitoring];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"kCLAuthorizationStatusAuthorizedWhenInUse");
            [self initializeMonitoring];
            break;
        default:
            break;
    }
}


- (void)sendNotification:(NSString*)message
{
    NSLog(@"sendNotification");

    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }

    // 通知を作成する
    UILocalNotification *notification = [[UILocalNotification alloc] init];

    notification.fireDate = [[NSDate date] init];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = message;
    notification.alertAction = @"Open";
    notification.soundName = UILocalNotificationDefaultSoundName;

    // 通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end