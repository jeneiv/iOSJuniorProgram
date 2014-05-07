//
//  BusStopAnnotation.h
//  LocationExample
//
//  Created by Viktor Jenei on 07/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface BusStopAnnotation : NSObject <MKAnnotation>

// Inherited from the MKAnnotation Protocol
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;

@end
