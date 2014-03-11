//
//  NSThreadViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 07/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController () {
    __weak IBOutlet UILabel * _targetLabel;
}

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)detachThreadButtonPressed:(id)sender {
    [NSThread detachNewThreadSelector:@selector(detachedAction:) toTarget:self withObject:@"Hello Thread"];
}

- (IBAction)subclassesThreadButtonPressed:(id)sender {
    CustomThread * thread = [[CustomThread alloc] init];
    thread.delegate = self;
    [thread start];
}

- (void)detachedAction:(NSString*)aString {
    [NSThread sleepForTimeInterval:3.0];
    _targetLabel.text = aString;
}

- (void)handleThreadResult:(NSString *)aString {
    [_targetLabel performSelectorOnMainThread:@selector(setText:) withObject:aString waitUntilDone:NO];
}

@end
