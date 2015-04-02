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

- (void)updateWithEntry:(Entry *)entry {
    
    self.entry = entry;
    
    self.titleLabel.text = entry.title;
    self.entryLabel.text = entry.entryText;
    self.timeStampLabel.text = [NSString stringWithFormat:@"%@", entry.timestamp];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor coolGreen];
    
                    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    self.titleLabel.backgroundColor = [UIColor darkGreen];
    self.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
    self.titleLabel.textColor = [UIColor brownColor];
    [self.view addSubview:self.titleLabel];
    
    self.timeStampLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 170, 225, 50)];
    self.timeStampLabel.backgroundColor = [UIColor darkGreen];
    self.timeStampLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
    self.timeStampLabel.textColor = [UIColor brownColor];
    [self.view addSubview:self.timeStampLabel];
    
    self.entryLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 240, 250, 350)];
    self.entryLabel.backgroundColor = [UIColor darkGreen];
    self.entryLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
    self.entryLabel.textColor = [UIColor brownColor];
    self.entryLabel.numberOfLines = 0;
    [self.view addSubview:self.entryLabel];
    
    [self updateWithEntry:self.entry]; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
