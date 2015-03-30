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
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    [self.mapView setMapType:MKMapTypeSatellite];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 45)];
    self.welcomeLabel.text = @" Welcome to My World! ";
    [self.welcomeLabel setFont:[UIFont fontWithName:@"ChalkDuster" size:28]];
    self.welcomeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.welcomeLabel sizeToFit];
    [self.view addSubview:self.welcomeLabel];
    
    [self animateLabel:self.welcomeLabel duration:3.0];
    
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 75, self.view.frame.size.width, 75)];
    [self.view addSubview:self.toolbar];
    
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *photo = [UIImage imageNamed:@"photo"];
    UIImage *entry = [UIImage imageNamed:@"entry"];
    UIImage *taj = [UIImage imageNamed:@"taj"];
    UIImage *trash = [UIImage imageNamed:@"trash"];
    
    UIBarButtonItem *pictureButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(goToAddPicture:)];
    [pictureButton setBackgroundImage:photo forState:UIControlStateNormal barMetrics:nil];
    [buttons addObject:pictureButton];
    
//    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL];
//    [buttons addObject:fixedSpace];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem];
    
    UIBarButtonItem *entryButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(goToAddEntry:)];
    [entryButton setBackgroundImage:entry forState:UIControlStateNormal barMetrics:nil];
    [buttons addObject:entryButton];
    
    UIBarButtonItem *flexItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem2];
    
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(goToAddLocation:)];
    [locationButton setBackgroundImage:taj forState:UIControlStateNormal barMetrics:nil];
    [buttons addObject:locationButton];
    
    UIBarButtonItem *flexItem3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:flexItem3];
    
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(removeLocation:)];
    [removeButton setBackgroundImage:trash forState:UIControlStateNormal barMetrics:nil];
    [buttons addObject:removeButton];
    
    [self.toolbar setItems:buttons];
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
