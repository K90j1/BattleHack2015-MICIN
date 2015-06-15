//
//  AppDelegate.m
//  MICIN_IOS
//
//  Created by bookair17 on 6/14/15.
//  Copyright (c) 2015 bookair17. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
		[[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
	}
	
//	UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
//	[application registerUserNotificationSettings:settings];
//
//	[application unregisterForRemoteNotifications];
//	[application registerForRemoteNotifications];
//
//
//
//	if ([CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
//		// CLLocationManagerの生成とデリゲートの設定
//		self.manager = [CLLocationManager new];
//		self.manager.delegate = self;
//
//		// 生成したUUIDからNSUUIDを作成
//		NSString *uuid = @"1E21BCE0-7655-4647-B492-A3F8DE2F9A02";
//		self.proximityUUID = [[NSUUID alloc] initWithUUIDString:uuid];
//
//		// CLBeaconRegionを作成
//		self.region = [[CLBeaconRegion alloc]
//					   initWithProximityUUID:self.proximityUUID
//					   identifier:@"45GXVEBQ63.com.coronet-internet.micin"];
//		self.region.notifyOnEntry = YES;
//		self.region.notifyOnExit = YES;
//		self.region.notifyEntryStateOnDisplay = NO;
//
//		// 領域観測を開始
//		[self.manager startMonitoringForRegion:self.region];
//	}
//

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    /* Set up Instance */
    FirstView *first = [[FirstView alloc] init];
    rootFirstViewInstance = [[UINavigationController alloc] initWithRootViewController:first];

    // Add to Ready up View on Window
    [self.window addSubview:rootFirstViewInstance.view];
    [self.window makeKeyAndVisible];

	
	return YES;
}

#pragma mark - CLLocationManagerDelegate methods
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

#pragma mark - Other methods
- (void)sendNotification:(NSString*)message
{
	// 通知を作成する
	UILocalNotification *notification = [[UILocalNotification alloc] init];
	
	notification.fireDate = [NSDate dateWithTimeInterval:10 sinceDate:[NSDate new]];
	notification.timeZone = [NSTimeZone defaultTimeZone];
	notification.alertBody = message;
	notification.alertAction = @"Open";
	notification.soundName = UILocalNotificationDefaultSoundName;
	
	// 通知を登録する
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
