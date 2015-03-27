//
//  ViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    [self.view addSubview:self.mapView];
    
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 45)];
    self.welcomeLabel.font = [UIFont systemFontOfSize:32];
    self.welcomeLabel.text = @" Welcome to My World! ";
    self.welcomeLabel.backgroundColor = [UIColor lightGrayColor];
    [self.welcomeLabel sizeToFit];
    [self.view addSubview:self.welcomeLabel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
