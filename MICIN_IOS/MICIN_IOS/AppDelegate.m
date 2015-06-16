//
//  AppDelegate.m
//  MICIN_IOS
//
//  Apache License, Version 2.0
//  Copyright (c) 2015 routeflags. All rights reserved.
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
	
	UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
	[application registerUserNotificationSettings:settings];
	[application unregisterForRemoteNotifications];
	[application registerForRemoteNotifications];

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

@end
