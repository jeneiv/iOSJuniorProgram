//
//  SynchronizationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 14/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "SynchronizationViewController.h"

@interface SynchronizationViewController () {
    NSLock * _someLock;
    __weak IBOutlet UITextField * _threadNameTextField;
}

@end

@implementation SynchronizationViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _someLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)doSomethingWithTitle:(NSString*)aTitle {
    [_someLock lock];
    for (NSUInteger i = 0; i < 10; ++i) {
        NSLog(@"%@ (%d)", aTitle, i);
        [NSThread sleepForTimeInterval:1.0f];
    }
    [_someLock unlock];
}

- (void)trySomethingWithTitle:(NSString*)aTitle {
    BOOL taskDone = NO;
    while (!taskDone) {
        NSLog(@"Trying to acquire lock (%@)", aTitle);
        if ([_someLock tryLock]) {
            NSLog(@"Succefully locked the thread (%@)", aTitle);
            for (NSUInteger i = 0; i < 10; ++i) {
                NSLog(@"%@ (%d)", aTitle, i);
                [NSThread sleepForTimeInterval:2.0f];
            }
            taskDone = YES;
            [_someLock unlock];
        }
        [NSThread sleepForTimeInterval:1.0f];
    }
}

- (IBAction)startSomeThread:(id)sender {
    NSLog(@"Dispatching thread");
    [NSThread detachNewThreadSelector:@selector(doSomethingWithTitle:) toTarget:self withObject:_threadNameTextField.text];
}

- (IBAction)startSomeOtherThread:(id)sender {
    NSLog(@"Dispatching thread with tryLock");
    [NSThread detachNewThreadSelector:@selector(trySomethingWithTitle:) toTarget:self withObject:_threadNameTextField.text];
}

@end
