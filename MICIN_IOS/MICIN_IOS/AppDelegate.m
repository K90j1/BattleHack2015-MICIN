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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    /* Set up Instance */
    FirstView *first = [[FirstView alloc] init];
    rootFirstViewInstance = [[UINavigationController alloc] initWithRootViewController:first];

    // Add to Ready up View on Window
    [self.window addSubview:rootFirstViewInstance.view];
    [self.window makeKeyAndVisible];

//        UIApplication *application = [UIApplication sharedApplication];
//    [self application:@"CLProximityImmediate"];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
    [application registerUserNotificationSettings:settings];

//    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
//        [application registerUserNotificationSettings:settings];
//    }

	return YES;
}


#pragma mark CLLocationManagerDelegate methods
// locationManager:didEnterRegion:
// Tells the delegate that the user entered the specified region.

// Beaconに入ったときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.enter play];
}


// locationManager:didExitRegion:
// Tells the delegate that the user left the specified region.

// Beaconから出たときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.exit play];
}

@end
