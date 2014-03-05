//
//  ScrollViewIBViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 03/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "ScrollViewIBViewController.h"

@interface ScrollViewIBViewController () {
    __weak IBOutlet UIScrollView * _scrollView;
    __weak IBOutlet UIImageView * _contentView;
}

@end

@implementation ScrollViewIBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[_scrollView addSubview:_contentView];
    _scrollView.contentSize = _contentView.frame.size;
    
    UIBarButtonItem * scrollToBottomButton = [[UIBarButtonItem alloc] initWithTitle:@"bottom" style:UIBarButtonItemStyleBordered target:self action:@selector(scrollToBottom:)];
    [self.navigationItem setRightBarButtonItem:scrollToBottomButton];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _contentView;
}

- (IBAction)scrollToBottom:(id)sender {
    // Make sure to zoom out
    [_scrollView zoomToRect:CGRectMake(0.0f, 0.0f, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    
    // Adjust offset
    CGSize scrollViewSize = _scrollView.frame.size;
    CGPoint newContentOffset = CGPointMake(0.0f, _contentView.frame.size.height - scrollViewSize.height);
    [_scrollView setContentOffset:newContentOffset animated:YES];
}

@end
