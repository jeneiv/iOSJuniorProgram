//
//  ImageFactory.h
//  ThreadingDemonstration
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFactory : NSObject

+ (UIImage*)imageWithURLString:(NSString*)anUrlString;

@end
