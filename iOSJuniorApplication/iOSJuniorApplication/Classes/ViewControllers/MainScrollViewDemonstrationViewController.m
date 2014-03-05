//
//  MainScrollViewDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 03/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "MainScrollViewDemonstrationViewController.h"
#import "ScrollViewIBViewController.h"

@implementation MainScrollViewDemonstrationViewController

- (IBAction)scrollViewButtonPressed:(id)sender {
    ScrollViewIBViewController * scrollViewController = [[ScrollViewIBViewController alloc] initWithNibName:@"ScrollViewIBView" bundle:nil];
    [self.navigationController pushViewController:scrollViewController animated:YES];
}

@end
