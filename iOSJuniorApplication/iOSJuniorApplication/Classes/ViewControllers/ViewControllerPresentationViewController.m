//
//  ViewControllerPresentationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 28/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ViewControllerPresentationViewController.h"
#import "ModallyPresentedViewController.h"

@interface ViewControllerPresentationViewController () {
    UIViewController * childViewController;
}

@end

@implementation ViewControllerPresentationViewController

- (IBAction)replaceRootViewController:(id)sender {
    NSLog(@"replaceRootViewController");
    UIViewController * vc = [[UIViewController alloc] init];
    [vc.view setBackgroundColor:[UIColor redColor]];
    self.view.window.rootViewController = vc;
    
}

- (IBAction)displayModalController:(id)sender {
    NSLog(@"displayModalController");
    ModallyPresentedViewController * vc = [[ModallyPresentedViewController alloc] initWithNibName:@"ModallyPresentedView" bundle:nil];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)displayNavigationController:(id)sender {
    NSLog(@"displayNavigationController");
    UIStoryboard * naviStoryBoard = [UIStoryboard storyboardWithName:@"NavigationControllerStoryBoard" bundle:nil];
    UIViewController * newRootViewController = [naviStoryBoard instantiateInitialViewController];
    self.view.window.rootViewController = newRootViewController;
}

- (IBAction)displayTabbarController:(id)sender {
    NSLog(@"displayTabbarController");
    UIStoryboard * naviStoryBoard = [UIStoryboard storyboardWithName:@"TabBarControllerStoryBoard" bundle:nil];
    UIViewController * newRootViewController = [naviStoryBoard instantiateInitialViewController];
    self.view.window.rootViewController = newRootViewController;
}

- (IBAction)displayContainerController:(id)sender {
    NSLog(@"displayContainerController");
    childViewController = [[UIViewController alloc] init];
    childViewController.view.backgroundColor = [UIColor greenColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"stg" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(someButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [childViewController.view addSubview:btn];
    btn.frame = CGRectMake(100.0f, 100.0f, 200.0f, 30.0f);
    
    [self addChildViewController:childViewController];
    childViewController.view.frame = self.view.frame;
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (IBAction)someButtonPressed:(id)sender {
    NSLog(@"SomeButtonPressed");
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

@end
