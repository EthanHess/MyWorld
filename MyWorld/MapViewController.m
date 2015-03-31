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
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface MapViewController () <MKMapViewDelegate>

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

- (void)setUpMapView {
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    [self.mapView setMapType:MKMapTypeSatellite];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapView addGestureRecognizer:pressRecognizer];
    
}

- (void)setUpToolbar {
    
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 75, self.view.frame.size.width, 75)];
    [self.view addSubview:self.toolbar];
    
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *photo = [UIImage imageNamed:@"photo"];
    UIImage *entry = [UIImage imageNamed:@"entry"];
    UIImage *taj = [UIImage imageNamed:@"taj"];
    UIImage *trash = [UIImage imageNamed:@"trash"];
    
    UIBarButtonItem *pictureButton = [[UIBarButtonItem alloc]initWithImage:photo style:UIBarButtonItemStylePlain target:self action:@selector(goToAddPicture:)];
    [buttons addObject:pictureButton];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem];
    
    UIBarButtonItem *entryButton = [[UIBarButtonItem alloc]initWithImage:entry style:UIBarButtonItemStylePlain target:self action:@selector(goToAddEntry:)];
    [buttons addObject:entryButton];
    
    UIBarButtonItem *flexItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem2];
    
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc]initWithImage:taj style:UIBarButtonItemStylePlain target:self action:@selector(goToAddLocation:)];
    [buttons addObject:locationButton];
    
    UIBarButtonItem *flexItem3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem3];
    
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc]initWithImage:trash style:UIBarButtonItemStylePlain target:self action:@selector(removeLocation:)];
    [buttons addObject:removeButton];
    
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
        
        
    }
    
}

- (void)goToAddPicture:(id)sender {
    
    PicturesViewController *picturesViewController = [PicturesViewController new];
    [self.navigationController pushViewController:picturesViewController animated:YES];
    
}

- (void)goToAddEntry:(id)sender {
    
    EntriesViewController *entriesViewController = [EntriesViewController new];
    [self.navigationController pushViewController:entriesViewController animated:YES];
    
}

- (void)goToAddLocation:(id)sender {
    
    
}

- (void)removeLocation:(id)sender {
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
