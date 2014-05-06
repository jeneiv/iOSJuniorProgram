//
//  CoreLocationViewController.h
//  LocationExample
//
//  Created by Viktor Jenei on 05/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import MapKit;

@interface CoreLocationViewController : UIViewController <CLLocationManagerDelegate>{
    __weak IBOutlet MKMapView * _mapView;
    CLLocationManager * _locationManager;
}

- (void)moveToCoordinate:(CLLocationCoordinate2D)aCoordinate;
- (void)moveToCoordinate:(CLLocationCoordinate2D)aCoordinate spanDistance:(CLLocationDistance)aDistance;

@end
