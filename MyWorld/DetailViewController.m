//
//  DetailViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "DetailViewController.h"
#import "UIColor+UIColorCategory.h"
#import "EntriesViewController.h"
#import "EntryController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor coolGreen];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    //add text from entry
    self.titleLabel.backgroundColor = [UIColor darkGreen];
    [self.view addSubview:self.titleLabel];
    
    self.timeStampLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 170, 80, 50)];
    self.timeStampLabel.backgroundColor = [UIColor darkGreen];
    [self.view addSubview:self.timeStampLabel];
    
    self.entryLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 240, 250, 350)];
    self.entryLabel.backgroundColor = [UIColor darkGreen];
    [self.view addSubview:self.entryLabel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
