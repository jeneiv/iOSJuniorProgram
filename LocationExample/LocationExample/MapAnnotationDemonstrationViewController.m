//
//  MapAnnotationDemonstrationViewController.m
//  LocationExample
//
//  Created by Jenei Viktor on 06/05/14.
//  Copyright (c) 2014 Viktor Jenei. All rights reserved.
//

#import "MapAnnotationDemonstrationViewController.h"
#import "RestaurantAnnotation.h"

#define ZERO_THRESHOLD 0.0002
#define NEAR_ZERO(x) ABS(x) < ZERO_THRESHOLD
#define NEAR_ZERO_COORDINATES(lat, lon) NEAR_ZERO(lat) && NEAR_ZERO(lon)

@interface MapAnnotationDemonstrationViewController () {
    CLLocationCoordinate2D _baseLocation;
    BOOL _hasBaseLocationSet;
}

@end

@implementation MapAnnotationDemonstrationViewController

#pragma mark - View Controller method(s)

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CLLocation * initialLocation = _locationManager.location;
    [self setBaseLocation:initialLocation];
    
}

#pragma mark - LocationManager Delegate method(s)

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [super locationManager:manager didUpdateLocations:locations];
    
    CLLocation * lastLocation = [locations lastObject];
    if (lastLocation != nil) {
        [self setBaseLocation:lastLocation];
    }
}

#pragma mark - MKMapKit Delegate method(s)

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView * anAnnotationView = nil;
    if ([annotation isKindOfClass:[RestaurantAnnotation class]]) { // Custom Annotation
        RestaurantAnnotation * restaurantAnnotation = annotation;
        NSString * restaurantIndentifier = @"restaurantAnnotation";
        anAnnotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:restaurantIndentifier];
        if (anAnnotationView == nil) {
            anAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:restaurantIndentifier];
        }
        anAnnotationView.canShowCallout = YES;
        anAnnotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:restaurantAnnotation.restaurantImage];
    }
    return anAnnotationView;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"Region did changed");
    [self convert];
}

#pragma mark - Custom method(s)

- (void)setBaseLocation:(CLLocation*)aLocation {
    BOOL areCoordinatesInvalid = NEAR_ZERO_COORDINATES(aLocation.coordinate.latitude, aLocation.coordinate.longitude);
    if (!areCoordinatesInvalid && !_hasBaseLocationSet) {
        _hasBaseLocationSet = YES;
        _baseLocation = aLocation.coordinate;
        [self moveToCoordinate:_baseLocation spanDistance:5000.0];
    }
}

- (IBAction)addSimpleAnnotationButtonPressed:(id)sender {
    NSLog(@"Add Simple Annotation");
    MKPointAnnotation * anAnnotation = [[MKPointAnnotation alloc] init];
    anAnnotation.title = @"Budapest";
    anAnnotation.subtitle = @"Center Point of Budapest";
    anAnnotation.coordinate = CLLocationCoordinate2DMake(47.4925, 19.051389); // 47.4925,19.051389
    [_mapView addAnnotation:anAnnotation];
}

- (IBAction)addCustomAnnotationButtonPressed:(id)sender {
    NSLog(@"Add Custom Annotation");
    RestaurantAnnotation * anAnnotation = [[RestaurantAnnotation alloc] init];
    anAnnotation.title = @"Hamburger";
    anAnnotation.subtitle = @"we also give fries ^_^";
    anAnnotation.coordinate = CLLocationCoordinate2DMake(47.4625, 19.051389); // 47.4925,19.051389
    anAnnotation.restaurantImage = [UIImage imageNamed:@"hamburger"];
    [_mapView addAnnotation:anAnnotation];
}

- (void)convert {
    CLLocationCoordinate2D aCoordinate = CLLocationCoordinate2DMake(47.4925, 19.051389);
    CGPoint aPoint = [_mapView convertCoordinate:aCoordinate toPointToView:_mapView];
    NSLog(@"View point relative to the map's view: %@", [NSValue valueWithCGPoint:aPoint]);
    
    CGPoint topLeftPoint = CGPointMake(0.0f, 0.0f);
    CLLocationCoordinate2D aMapCoordinate = [_mapView convertPoint:topLeftPoint toCoordinateFromView:_mapView];
    NSLog(@"Map coordinates for the view's top left corner: %.4f;%.4f", aMapCoordinate.latitude, aMapCoordinate.longitude);
}

@end
