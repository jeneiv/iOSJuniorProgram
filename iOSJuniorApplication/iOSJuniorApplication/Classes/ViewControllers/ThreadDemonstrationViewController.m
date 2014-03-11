//
//  ThreadDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 07/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ThreadDemonstrationViewController.h"

@interface ThreadDemonstrationViewController () {
    __weak IBOutlet UILabel * _numberLabel;
}

@end

@implementation ThreadDemonstrationViewController


- (IBAction)sliderValueChanged:(UISlider *)sender {
    _numberLabel.text = [NSString stringWithFormat:@"%.1f", sender.value];
}

- (IBAction)performSelectorButtonPressed:(id)sender {
    _numberLabel.text = @"0.0";
    [self performSelectorInBackground:@selector(performBackgroundAction) withObject:nil];
}

- (IBAction)performSelectorAfterDelayButtonPressed:(id)sender {
    [self performSelector:@selector(performUIUpdate:) withObject:@"2.0" afterDelay:5.0];
}

- (IBAction)uiBlockerButtonPressed:(id)sender {
    // Do not ever do something like this!!!
    [self performSelectorOnMainThread:@selector(performBackgroundAction) withObject:nil waitUntilDone:YES];
}

- (void)performBackgroundAction {
    [NSThread sleepForTimeInterval:5.0];
    NSLog(@"Running");
    [NSThread sleepForTimeInterval:5.0];
    [self performSelectorOnMainThread:@selector(performUIUpdate:) withObject:@"1.0" waitUntilDone:NO];
}

- (void)performUIUpdate:(NSString*)aString {
    if (aString != nil) {
        _numberLabel.text = aString;
    }
}

@end
