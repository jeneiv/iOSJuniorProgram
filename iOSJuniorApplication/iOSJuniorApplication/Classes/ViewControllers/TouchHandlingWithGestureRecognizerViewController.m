//
//  TouchHandlingWithGestureRecognizerViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 25/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "TouchHandlingWithGestureRecognizerViewController.h"

@implementation TouchHandlingWithGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Adding a swipe gesture recognizer programatically
    UISwipeGestureRecognizer * downGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [downGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:downGestureRecognizer];
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Swipe direction: right");
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Swipe direction: left");
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"Swipe direction: down");
    }
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    NSLog(@"Long press recognized on grey view");
}

@end
