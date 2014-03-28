//
//  LocalizationDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 27/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "LocalizationDemonstrationViewController.h"

@interface LocalizationDemonstrationViewController () {
    
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_contentLabel;
}

@end

@implementation LocalizationDemonstrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleLabel.text = NSLocalizedString(@"title_hw", nil);
    _contentLabel.text = NSLocalizedStringFromTable(@"content_text", @"MainStrings", nil);
}

@end
