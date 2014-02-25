//
//  TouchHandlerView.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 25/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "TouchHandlerView.h"

@implementation TouchHandlerView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesBegan", NSStringFromClass([self class]));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesEnded", NSStringFromClass([self class]));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    NSLog(@"%@ Touch location in view: %@", NSStringFromClass([self class]), [NSValue valueWithCGPoint:touchLocation]);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesCancelled", NSStringFromClass([self class]));
}

@end
