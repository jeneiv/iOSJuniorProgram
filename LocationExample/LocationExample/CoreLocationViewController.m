//
//  CoreLocationViewController.m
//  LocationExample
//
//  Created by Viktor Jenei on 05/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "CoreLocationViewController.h"
@import MapKit;

@interface CoreLocationViewController () {
    __weak IBOutlet MKMapView * _mapView;
    CLLocationManager * _locationManager;
}

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

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation {

    CLLocationCoordinate2D coordinate = newLocation.coordinate;
    CLLocationDistance altitude = newLocation.altitude;
    
    // Debugging
    NSLog(@"Recived location update.\nCoords: (%.4f;%.4f)\nAlt: %.4f", coordinate.latitude, coordinate.longitude, altitude);
    
    // Zooming ang positioning mapview
    
    MKCoordinateRegion mapRegion = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    [_mapView setRegion:mapRegion animated:YES];
}

#pragma mark - Annotations

- (void)addAnnotation {
    
    MKPointAnnotation * anAnnotation = [[MKPointAnnotation alloc] init];
    anAnnotation.title = @"Hopp";
    anAnnotation.subtitle = @"Itt van valami";
    anAnnotation.coordinate = CLLocationCoordinate2DMake(37.3308, -122.0307);
    [_mapView addAnnotation:anAnnotation];
    
    /*
    MKPinAnnotationView * aPinAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:anAnnotation reuseIdentifier:@"haburger"];
    aPinAnnotation.image = [UIImage imageNamed:@"hamburger.png"];
    [_mapView addAnnotation:aPinAnnotation];
    */
}

@end
