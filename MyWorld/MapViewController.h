//
//  ViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CalloutView.h"
#import <UIKit/UIKit.h>
@import MapKit;

@interface MapViewController : UIViewController

@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CalloutView *customView;


@end

