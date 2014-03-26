//
//  FileHandlingDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 25/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "FileHandlingDemonstrationViewController.h"

@interface FileHandlingDemonstrationViewController () {
    __weak IBOutlet UITextField * folderName;
    
}

@end

@implementation FileHandlingDemonstrationViewController

- (IBAction)createFolderPressed:(id)sender {
    
    NSFileManager * fManager = [NSFileManager defaultManager];
    NSString * folderPath = [NSHomeDirectory() stringByAppendingPathComponent:folderName.text];
    NSError * createError = nil;
    BOOL success = [fManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:&createError];
    if (!success) {
        NSLog(@"An error occured during directory creation: %@", [createError description]);
    }
    
}

- (IBAction)deleteFolderPressed:(id)sender {
    
    NSFileManager * fManager = [NSFileManager defaultManager];
    NSString * folderPath = [NSHomeDirectory() stringByAppendingPathComponent:folderName.text];
    NSError * deleteError = nil;
    BOOL success = [fManager removeItemAtPath:folderPath error:&deleteError];
    if (!success) {
        NSLog(@"An error occured during directory deletion: %@", [deleteError description]);
    }
    
}

- (IBAction)lookupFolderPressed:(id)sender {
    
    NSFileManager * fManager = [NSFileManager defaultManager];
    NSString * folderPath = [NSHomeDirectory() stringByAppendingPathComponent:folderName.text];
    BOOL isDir = NO;
    BOOL lookupResult = [fManager fileExistsAtPath:folderPath isDirectory:&isDir];
    if (lookupResult) {
        NSLog(@"The directory/file %@ exists", folderName.text);
        NSLog(@"  And it is a %@", isDir ? @"directory" : @"file");
    }
    else {
        NSLog(@"Nothing exists at the given path");
    }
    
}


- (void)listFilesAtPath:(NSString*)aPath {
    
    NSFileManager * fManager = [NSFileManager defaultManager];
    NSArray * dirContent = [fManager contentsOfDirectoryAtPath:aPath error:nil];
    for (NSString * file in dirContent) {
        NSLog(@"%@", file);
    }
    
}

- (void)fetchAttributesAtPath:(NSString*)aPath {

    NSFileManager * fManager = [NSFileManager defaultManager];
    if ([fManager fileExistsAtPath:aPath]) {
        NSDictionary * attributes = [fManager attributesOfItemAtPath:aPath error:nil];
        NSLog(@"Attrs: %@", attributes);
    }
    
    
}

@end
