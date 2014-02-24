//
//  StoryBoardLoadedViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 24/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "StoryBoardLoadedViewController.h"

@interface StoryBoardLoadedViewController ()

@end

@implementation StoryBoardLoadedViewController

- (void)loadView {
    [super loadView];
    NSLog(@"I. Creating the view in the loadView method");
//    NSLog(@"Green View Frame: %@", [NSValue valueWithCGRect:_greenView.frame]);
//    NSLog(@"Green View Center: %@", [NSValue valueWithCGPoint:_greenView.center]);
//    NSLog(@"Green View Bounds: %@", [NSValue valueWithCGRect:_greenView.bounds]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"II. The view is loaded");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"III. The view is ready, it will appear soon");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"IV. The View has just appeared");
}

@end
