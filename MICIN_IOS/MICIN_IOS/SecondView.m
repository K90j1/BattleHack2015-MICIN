//
// Created by bookair17 on 6/14/15.
// Copyright (c) 2015 bookair17. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

@synthesize webView = _webView;
@synthesize proximityUUID = _proximityUUID;

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
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString: @"https://secret-inlet-6229.herokuapp.com/"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *body = [NSString stringWithFormat: @"proximityUUID=%@&UUID=%@", _proximityUUID, uuid];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]initWithURL: url];
    [urlRequest setHTTPMethod: @"GET"];
    [urlRequest setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
    [self.webView loadRequest: urlRequest];
}

@end