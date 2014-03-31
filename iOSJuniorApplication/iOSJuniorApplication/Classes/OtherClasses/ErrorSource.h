//
//  ErrorSource.h
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 31/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ErrorSourceDelegate <NSObject>
- (void)handleError:(NSError*)anError;
@end

@interface ErrorSource : NSObject

@property (weak, nonatomic) id <ErrorSourceDelegate> delegate;

- (void)throwAnException;
- (void)createAnErrorByReference:(NSError**)anError;
- (void)notifyDelegateWithError;

@end
