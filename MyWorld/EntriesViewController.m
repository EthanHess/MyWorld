//
//  EntriesViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntriesViewController.h"
#import "EntriesViewDataSource.h"
#import "UIColor+UIColorCategory.h"

@interface EntriesViewController () <UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate>

@end

@implementation EntriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleField = [[UITextField alloc]initWithFrame:CGRectMake(50, 90, self.view.frame.size.width - 100, 50)];
    self.titleField.placeholder = @" Entry title ";
    self.titleField.borderStyle = UITextBorderStyleRoundedRect;
    self.titleField.delegate = self;
    [self.view addSubview:self.titleField];
    
    self.entryField = [[UITextView alloc]initWithFrame:CGRectMake(50, 165, self.view.frame.size.width - 100, 150)];
    self.entryField.delegate = self;
    [self.view addSubview:self.entryField];
    
    self.addButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 280, 75, 50)];
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
