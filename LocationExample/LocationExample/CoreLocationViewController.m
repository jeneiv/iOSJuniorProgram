//
//  CoreLocationViewController.m
//  LocationExample
//
//  Created by Viktor Jenei on 05/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "CoreLocationViewController.h"

@interface CoreLocationViewController () 

@end

@implementation CoreLocationViewController

#pragma mark - VC Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        [self setUpLocationManager];
    }
    return self;
}

#pragma mark - Actions

- (IBAction)startButtonPressed:(id)sender {
    [_locationManager startUpdatingLocation];
}

- (IBAction)stopButtonPressed:(id)sender {
    [_locationManager stopUpdatingLocation];
}

- (IBAction)addButtonPressed:(id)sender {
    [self addAnnotation];
}

#pragma mark - Location Setup and Update handling

- (void)setUpLocationManager {
    _locationManager.delegate = self;
    _locationManager.distanceFilter = 100.0;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation * lastLocation = [locations lastObject];
    if (lastLocation != nil) {
        CLLocationCoordinate2D coordinate = lastLocation.coordinate;
        CLLocationDistance altitude = lastLocation.altitude;
        
        // Debugging
        NSLog(@"Recived location update.\nCoords: (%.4f;%.4f)\nAlt: %.4f", coordinate.latitude, coordinate.longitude, altitude);
        
        // Zooming ang positioning mapview
        
        [self moveToCoordinate:coordinate];
    }
}

- (void)moveToCoordinate:(CLLocationCoordinate2D)aCoordinate {
    [self moveToCoordinate:aCoordinate spanDistance:500.0];
}

- (void)moveToCoordinate:(CLLocationCoordinate2D)aCoordinate spanDistance:(CLLocationDistance)aDistance {
    MKCoordinateRegion mapRegion = MKCoordinateRegionMakeWithDistance(aCoordinate, aDistance, aDistance);
    [_mapView setRegion:mapRegion animated:YES];
}

#pragma mark - Annotations

- (void)addAnnotation {
    
    MKPointAnnotation * anAnnotation = [[MKPointAnnotation alloc] init];
    anAnnotation.title = @"Hopp";
    anAnnotation.subtitle = @"Itt van valami";
    anAnnotation.coordinate = CLLocationCoordinate2DMake(37.3308, -122.0307);
    [_mapView addAnnotation:anAnnotation];
    
}

@end
