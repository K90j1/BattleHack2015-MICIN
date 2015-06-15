//
// Created by bookair17 on 6/14/15.
// Copyright (c) 2015 bookair17. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

@synthesize webView = _webView;

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

    NSString *strURL = @"https://secret-inlet-6229.herokuapp.com/";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest: urlRequest];
}
@end