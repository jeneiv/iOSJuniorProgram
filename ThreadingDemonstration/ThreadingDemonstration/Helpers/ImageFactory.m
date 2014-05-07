//
//  ImageFactory.m
//  ThreadingDemonstration
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "ImageFactory.h"
#import "FileHelper.h"

@implementation ImageFactory

+ (UIImage*)imageWithURLString:(NSString*)anUrlString {
    UIImage * resultImage = nil;
    
    NSURL * imageURL = [NSURL URLWithString:anUrlString];
    if (imageURL != nil) {
        
        BOOL isDir = NO;
        NSString * filePath = [[FileHelper pathForLibrarySubFolder:IMAGE_CACHE_DIR] stringByAppendingPathComponent:[imageURL absoluteString]];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir]) {
            NSLog(@"Loading image From cache (%@)", filePath);
            NSData * cachedImageData = [NSData dataWithContentsOfFile:filePath];
            resultImage = [UIImage imageWithData:cachedImageData];
        }
        else {
            NSLog(@"Loading image From the internet (%@)", filePath);
            NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
            if (imageData != nil) {
                [imageData writeToFile:filePath atomically:YES];
                resultImage = [UIImage imageWithData:imageData];
            }
        }
    }
    
    return resultImage;
}

@end
