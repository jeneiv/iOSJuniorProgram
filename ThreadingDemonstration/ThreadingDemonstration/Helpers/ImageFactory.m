//
//  ImageFactory.m
//  ThreadingDemonstration
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "ImageFactory.h"

@implementation ImageFactory

+ (UIImage*)imageWithURLString:(NSString*)anUrlString {
    UIImage * resultImage = nil;
    
    NSURL * imageURL = [NSURL URLWithString:anUrlString];
    if (imageURL != nil) {
        
        NSLog(@"Loading image From the internet (%@)", imageURL.absoluteString);
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData != nil) {
            resultImage = [UIImage imageWithData:imageData];
        }
    }
    
    return resultImage;
}

@end
