//
//  CustomOperation.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 10/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation ()

@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) NSTimeInterval interval;

@end

@implementation CustomOperation

- (id)initWithTitle:(NSString*)aTitle timeInterval:(NSTimeInterval)anInterval {
    self = [super init];
    if (self) {
        _title = aTitle;
        _interval = anInterval;
    }
    return self;
}

- (void)main {
    @autoreleasepool {
        [NSThread sleepForTimeInterval:_interval];
        NSLog(@"Operation finished for title: %@", _title);
    }
}

@end
