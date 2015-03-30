//
//  ViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <MKMapViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    [self.mapView setMapType:MKMapTypeSatellite];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 80, self.view.frame.size.width - 50, 45)];
    self.welcomeLabel.font = [UIFont systemFontOfSize:32];
    self.welcomeLabel.text = @" Welcome to My World! ";
    self.welcomeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.welcomeLabel sizeToFit];
    [self.view addSubview:self.welcomeLabel];
    
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
    
    
}

- (void)goToAddEntry:(id)sender {
    
    
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
