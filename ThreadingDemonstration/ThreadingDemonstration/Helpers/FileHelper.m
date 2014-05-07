//
//  FileHelper.m
//  ThreadingDemonstration
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "FileHelper.h"

NSString *const IMAGE_CACHE_DIR = @"ImageCache";

@implementation FileHelper

+ (NSString*)appLibraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString*)pathForLibrarySubFolder:(NSString*)aFolderName {
    NSString * directory = [[self appLibraryPath] stringByAppendingPathComponent:aFolderName];
    
    BOOL isDir = YES;
    if(![[NSFileManager defaultManager] fileExistsAtPath:directory isDirectory:&isDir]) {
        NSError * error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"Directory creation error (%@)", aFolderName);
            directory = nil;
        }
    }
    
    return directory;
}


@end
