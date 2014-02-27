//
//  ViewResizingViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 27/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ViewResizingViewController.h"

@implementation ViewResizingViewController

- (IBAction)autoResizeButtonPressed:(id)sender {
    UIViewController * vc = [[UIViewController alloc] initWithNibName:@"LayoutUsingAutoResizeMaskView" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)autoLayoutButtonPressed:(id)sender {
    UIViewController * vc = [[UIViewController alloc] initWithNibName:@"LayoutUsingAutoLayoutView" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
