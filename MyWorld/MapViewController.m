//
//  ViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "MapViewController.h"
#import "PicturesViewController.h"
#import "EntriesViewController.h"
#import "UIColor+UIColorCategory.h"
#import "TravelPickerViewController.h"
#import "MapAnnotation.h"
#import <math.h>
@import CoreLocation;

static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface MapViewController () <MKMapViewDelegate, UIActionSheetDelegate, UISearchBarDelegate, CLLocationManagerDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor backgroundColor];
    
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 45)];
    self.welcomeLabel.text = @" Welcome to My World! ";
    self.welcomeLabel.textColor = [UIColor textLabelColor];
    [self.welcomeLabel setFont:[UIFont fontWithName:@"ChalkDuster" size:28]];
    self.welcomeLabel.backgroundColor = [UIColor labelBackground];
    [self.welcomeLabel sizeToFit];
    [self.view addSubview:self.welcomeLabel];
    
    [self.view bringSubviewToFront:self.welcomeLabel];
    
    [self animateLabel:self.welcomeLabel duration:2.0];
    
    [self setUpMapView];
    
    [self setUpToolbar];
    
    [self setUpSearch];

    [self registerForNotificaitons];
    
    [self setUpLocationManager]; 
    
    
    
}

- (void)setUpLocationManager {
    
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    
    
}

- (void)registerForNotificaitons {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showEntryView) name:@"entriesButtonPressed" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showPictureView) name:@"picturesButtonPressed" object:nil];
}

- (void)animateLabel:(UIView *)view duration:(float)duration {
    
    CGAffineTransform bigger = CGAffineTransformMakeScale(10, 10);
    CGAffineTransform smaller = CGAffineTransformMakeScale(1, 1);
    CGAffineTransform rotate = CGAffineTransformMakeRotation(radians(180));
    [UIView animateWithDuration:duration animations:^{
        view.transform = bigger;
        view.transform = rotate;
        view.transform = smaller;
    }];
    
}

- (void)setUpSearch {
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15, 480, 285, 50)];
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.placeholder = @" Search Location ";
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(315, 480, 50, 50)];
    [self.button setTitle:@" Go! " forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor coolGreen]];
    [self.button addTarget:self action:@selector(searchBarPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    
    
}

-(void)searchBarPressed:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        MKCoordinateRegion region;
        region.center.latitude = placemark.region.center.latitude;
        region.center.longitude = placemark.region.center.longitude;
        MKCoordinateSpan span;
        double radius = placemark.region.radius / 1000;
        
//        CLCircularRegion *region = [CLCircularRegion alloc] initWithCenter:<#(CLLocationCoordinate2D)#> radius:<#(CLLocationDistance)#> identifier:<#(NSString *)#>
        
        NSLog(@"[searchBarSearchButtonClicked] Radius is %f", radius);
        span.latitudeDelta = radius / 112.0;
        
        region.span = span;
        
        [self.mapView setRegion:region animated:YES];
        
    }];
    
    
}

- (void)setUpMapView {
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    [self.mapView setMapType:MKMapTypeSatellite];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
    
    UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapView addGestureRecognizer:pressRecognizer];


}

- (void)setUpToolbar {
    
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 75, self.view.frame.size.width, 75)];
    self.toolbar.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.toolbar];
    
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *photo = [UIImage imageNamed:@"photo"];
    UIImage *entry = [UIImage imageNamed:@"entry"];
    UIImage *taj = [UIImage imageNamed:@"help"];
    UIImage *trash = [UIImage imageNamed:@"share"];
    
    UIBarButtonItem *pictureButton = [[UIBarButtonItem alloc]initWithImage:photo style:UIBarButtonItemStylePlain target:self action:@selector(goToAddPicture:)];
    [buttons addObject:pictureButton];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem];
    
    UIBarButtonItem *entryButton = [[UIBarButtonItem alloc]initWithImage:entry style:UIBarButtonItemStylePlain target:self action:@selector(goToAddEntry:)];
    [buttons addObject:entryButton];
    
    UIBarButtonItem *flexItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem2];
    
    UIBarButtonItem *randomButton = [[UIBarButtonItem alloc]initWithImage:taj style:UIBarButtonItemStylePlain target:self action:@selector(randomButtonPressed:)];
    [buttons addObject:randomButton];
    
    UIBarButtonItem *flexItem3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem3];
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]initWithImage:trash style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonPressed:)];
    [buttons addObject:shareButton];
    
    [self.toolbar setItems:buttons];
    
}

- (void)handleLongPressGesture:(UIGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.mapView removeGestureRecognizer:sender];
    }
    else {
        
        CGPoint point = [sender locationInView:self.mapView];
        CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
        
        //add annotation here
        MapAnnotation *dropPin = [[MapAnnotation alloc] initWithLocation:locCoord];
//        dropPin.latitude = locCoord.latitude;
//        dropPin.coordinate.longitude = [NSNumber numberWithDouble:locCoord.longitude];
        
        
        
        [self.mapView addAnnotation:dropPin];
        
    }
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    self.customView = [[CalloutView alloc]initWithFrame:CGRectMake(0, 0, 175, 290)];
    
//    [view addSubview:self.customView];
    [self.customView setHidden:NO];
    [mapView addSubview:self.customView];
    
}

- (void)goToAddPicture:(id)sender {
    
    PicturesViewController *picturesViewController = [PicturesViewController new];
    [self.navigationController pushViewController:picturesViewController animated:YES];
    
}

- (void)goToAddEntry:(id)sender {
    
    EntriesViewController *entriesViewController = [EntriesViewController new];
    [self.navigationController pushViewController:entriesViewController animated:YES];
    
}

- (void)showPictureView {
    
    PicturesViewController *picturesViewController = [PicturesViewController new];
    [self.navigationController pushViewController:picturesViewController animated:YES];
    
}

- (void)showEntryView {
    
    EntriesViewController *entriesViewController = [EntriesViewController new];
    [self.navigationController pushViewController:entriesViewController animated:YES];
}


- (void)randomButtonPressed:(id)sender {
    
    TravelPickerViewController *travelPickerController = [TravelPickerViewController new];
    [self.navigationController pushViewController:travelPickerController animated:YES];
}

- (void)shareButtonPressed:(id)sender {
    
    NSString *string = @"This is my string";
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:@[string] applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
