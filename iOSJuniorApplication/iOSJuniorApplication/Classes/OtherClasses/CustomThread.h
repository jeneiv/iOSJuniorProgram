//
//  CustomThread.h
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 07/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomThreadDelegate <NSObject>

- (void)handleThreadResult:(NSString*)aString;

@end

@interface CustomThread : NSThread

@property (weak, nonatomic) id<CustomThreadDelegate> delegate;

@end
