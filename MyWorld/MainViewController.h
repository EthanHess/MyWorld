//
//  ViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface MainViewController : UIViewController

@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) MKMapView *mapView;


@end

