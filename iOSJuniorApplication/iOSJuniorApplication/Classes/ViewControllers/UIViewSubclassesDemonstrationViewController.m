//
//  UIViewSubclassesDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 03/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "UIViewSubclassesDemonstrationViewController.h"

@interface UIViewSubclassesDemonstrationViewController () {
    __weak IBOutlet UIActivityIndicatorView * _indicator;
    __weak IBOutlet UIProgressView * _progressView;
    __weak IBOutlet UIImageView *_imageView;
}

@end

@implementation UIViewSubclassesDemonstrationViewController

- (IBAction)switchValueChanged:(UISwitch*)sender {
    if ([sender isOn]) {
        [_indicator startAnimating];
    }
    else {
        [_indicator stopAnimating];
    }
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    [_progressView setProgress:sender.value animated:YES];
}

- (IBAction)animateButtonPressed:(UIButton *)sender {
    NSArray * animationImages = @[[UIImage imageNamed:@"win_1.png"], [UIImage imageNamed:@"win_2.png"], [UIImage imageNamed:@"win_3.png"],
                                  [UIImage imageNamed:@"win_4.png"], [UIImage imageNamed:@"win_5.png"], [UIImage imageNamed:@"win_6.png"],
                                  [UIImage imageNamed:@"win_7.png"], [UIImage imageNamed:@"win_8.png"], [UIImage imageNamed:@"win_9.png"],
                                  [UIImage imageNamed:@"win_10.png"], [UIImage imageNamed:@"win_11.png"], [UIImage imageNamed:@"win_12.png"],
                                  [UIImage imageNamed:@"win_13.png"], [UIImage imageNamed:@"win_14.png"], [UIImage imageNamed:@"win_15.png"],
                                  [UIImage imageNamed:@"win_16.png"]];
    _imageView.animationImages = animationImages;
    _imageView.animationDuration = 1.0;
    [_imageView startAnimating];
}

- (IBAction)showAlertButtonPressed:(id)sender {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"This is an alert"
                                                         message:@"This is its message"
                                                        delegate:self
                                               cancelButtonTitle:@"dismiss"
                                               otherButtonTitles:@"ok", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"AlertViewDelegate -- Button at index #%d pressed", buttonIndex);
}



@end
