//
//  ErrorSource.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 31/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ErrorSource.h"
#import "CustomException.h"

@implementation ErrorSource

- (void)throwAnException {
    @throw([CustomException exceptionWithName:@"DemonstrationException" reason:@"I don't like your face" userInfo:nil]);
}

- (void)createAnErrorByReference:(NSError**)anError {
    *anError = [NSError errorWithDomain:@"com.victo.generalError" code:101 userInfo:nil];
}

- (void)notifyDelegateWithError {
    if (_delegate != nil && [_delegate respondsToSelector:@selector(handleError:)]) {
        NSError * anError = [NSError errorWithDomain:@"com.victo.generalError" code:102 userInfo:nil];
        [_delegate handleError:anError];
    }
}

@end
