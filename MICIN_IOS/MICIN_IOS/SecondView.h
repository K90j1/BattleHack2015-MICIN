//
// Created by bookair17 on 6/14/15.
// Copyright (c) 2015 bookair17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstView.h"

@interface SecondView : UIViewController <UIWebViewDelegate>

@property(strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) NSString *beaconUUID;

@end

