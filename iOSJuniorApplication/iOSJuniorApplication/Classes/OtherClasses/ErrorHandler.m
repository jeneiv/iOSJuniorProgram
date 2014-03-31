//
//  ErrorHandler.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 31/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ErrorHandler.h"
#import "CustomException.h"

@interface ErrorHandler ()

@property (strong, nonatomic) ErrorSource * es;

@end

@implementation ErrorHandler

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _es = [[ErrorSource alloc] init];
    }
    return self;
}

- (IBAction)startExceptionHandling {
    
    @try {
        [_es throwAnException];
    }
    @catch (CustomException * anException) {
        // Handling only Exceptions of the type CustomException
        NSLog(@"Fetched an exception (%@, %@)", anException.name, anException.reason);
    }
    @catch (NSException * anException) {
        // ReThrowing any other NSExceptions
        @throw;
    }
    @finally {
        NSLog(@"Exception Handling flow has finished");
    }
}

- (IBAction)startErrorHandlingByDelegate {
    _es.delegate = self;
    [_es notifyDelegateWithError];
}

- (IBAction)startErrorHandlingWithErrorReference {
    NSError * anError = nil;
    [_es createAnErrorByReference:&anError];
    if (anError != nil) {
        NSLog(@"Got an error by pointer reference (%@, %ld)", anError.domain, (long)anError.code);
    }
}

#pragma mark - ErrorSourceDelegate Method(s)

- (void)handleError:(NSError*)anError {
    NSLog(@"Got an error as a delegate (%@, %ld)", anError.domain, (long)anError.code);
}

@end
