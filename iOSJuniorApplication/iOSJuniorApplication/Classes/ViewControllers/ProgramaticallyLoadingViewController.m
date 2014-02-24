//
//  ProgramaticallyLoadingViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 24/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ProgramaticallyLoadingViewController.h"

@interface ProgramaticallyLoadingViewController () {
    UIView * _blueView;
}
@end


@implementation ProgramaticallyLoadingViewController

- (void)loadView {
    NSLog(@"I. Creating the view in the loadView method");
    
    // Creating the main view of the controller
    CGRect viewRectangle = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView * mainView = [[UIView alloc] initWithFrame:viewRectangle];
    mainView.backgroundColor = [UIColor greenColor];
    self.view = mainView;
    
    
    // Adding some subViews
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 100.0f, 50.0f)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    _blueView = [[UIView alloc] init];
    _blueView.frame = CGRectMake(10.0f, 70.0f, self.view.frame.size.width - 20.0f, 100.0f);
    [_blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_blueView];
    
    UIView * yellowView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 30.0f, 30.0f)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [_blueView addSubview:yellowView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"II. The view is loaded");
    NSLog(@"Blue View Frame: %@", [NSValue valueWithCGRect:_blueView.frame]);
    NSLog(@"Blue View Center: %@", [NSValue valueWithCGPoint:_blueView.center]);
    NSLog(@"Blue View Bounds: %@", [NSValue valueWithCGRect:_blueView.bounds]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"III. The view is ready, it will appear soon");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"IV. The View has just appeared");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"V. Soon the view will desappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"VI. The view is no longer visible on the screen");
}

@end
