//
//  CustomThread.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 07/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "CustomThread.h"

@implementation CustomThread

- (void)main {
    @autoreleasepool {
        [NSThread sleepForTimeInterval:3.0];
        if (_delegate != nil) {
            [_delegate handleThreadResult:@"SubclassedThread Result"];
        }
        
    }
}

@end
