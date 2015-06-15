//
// Created by bookair17 on 6/14/15.
// Copyright (c) 2015 bookair17. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

@synthesize webView = _webView;
@synthesize beaconUUID =  _beaconUUID;

- (id) init {
    self = [super init];
    return self;
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = self.view.bounds;
    self.webView = [[UIWebView alloc] initWithFrame:rect];
    self.webView.delegate = self;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *urlStr = [NSString stringWithFormat:@"https://secret-inlet-6229.herokuapp.com/?proximityUUID=%@&UUID=%@"
            ,self.beaconUUID
            ,uuid];
    NSURL* nsUrl = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL: [request URL]];
        return NO;
    }

    return YES;
}


@end