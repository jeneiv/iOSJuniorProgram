//
//  WebViewViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 03/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController () {
    __weak IBOutlet UIWebView * _webView;
}

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	// Setting up initial url request
    NSURLRequest * aRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.index.hu"]];
    [_webView loadRequest:aRequest];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Setting up header Buttons
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
    UIBarButtonItem * forwardButton = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStyleBordered target:self action:@selector(forwardButtonPressed)];
    [self.navigationItem setRightBarButtonItems:@[forwardButton, backButton] animated:YES];
}

- (void)backButtonPressed {
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
}

- (void)forwardButtonPressed {
    if ([_webView canGoForward]) {
        [_webView goForward];
    }
}

// This delegate method will ask for approval for every frame within the webview
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"Will Load URL: %@", request.URL.absoluteString);
    return YES;
}

@end
