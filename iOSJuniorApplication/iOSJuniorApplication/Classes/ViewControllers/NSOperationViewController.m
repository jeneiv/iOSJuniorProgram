//
//  NSOperationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 10/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "NSOperationViewController.h"
#import "CustomOperation.h"

@interface NSOperationViewController ()

@property (strong, nonatomic) NSOperationQueue * anOperationQueue;

@end

@implementation NSOperationViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _anOperationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (IBAction)startButtonPressed:(id)sender {
    CustomOperation * operation1 = [[CustomOperation alloc] initWithTitle:@"first" timeInterval:3.0];
    CustomOperation * operation2 = [[CustomOperation alloc] initWithTitle:@"second" timeInterval:1.0];
    CustomOperation * operation3 = [[CustomOperation alloc] initWithTitle:@"third" timeInterval:4.0];
    CustomOperation * operation4 = [[CustomOperation alloc] initWithTitle:@"forth" timeInterval:8.0];
    CustomOperation * operation5 = [[CustomOperation alloc] initWithTitle:@"fifth" timeInterval:2.0];
    [operation5 addDependency:operation4];
    
    self.anOperationQueue.maxConcurrentOperationCount = 1;
    
    [self.anOperationQueue addOperation:operation1];
    [self.anOperationQueue addOperation:operation2];
    [self.anOperationQueue addOperation:operation3];
    [self.anOperationQueue addOperation:operation4];
    [self.anOperationQueue addOperation:operation5];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [_anOperationQueue cancelAllOperations];
}

- (IBAction)suspendButtonPressed:(id)sender {
    [_anOperationQueue setSuspended:![_anOperationQueue isSuspended]];
}

@end
