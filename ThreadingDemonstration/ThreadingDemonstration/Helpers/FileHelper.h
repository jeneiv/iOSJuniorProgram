//
//  FileHelper.h
//  ThreadingDemonstration
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const IMAGE_CACHE_DIR;

@interface FileHelper : NSObject

+ (NSString*)appLibraryPath;
+ (NSString*)pathForLibrarySubFolder:(NSString*)aFolderName;

@end
