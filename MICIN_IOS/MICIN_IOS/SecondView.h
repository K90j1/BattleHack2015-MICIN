//
// Apache License, Version 2.0
// Copyright (c) 2015 routeflags. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstView.h"

@interface SecondView : UIViewController <UIWebViewDelegate>

@property(strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) NSString *beaconUUID;

@end

