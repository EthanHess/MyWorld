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
    
    self.view.backgroundColor = [UIColor labelBackground];
    
    self.titleField = [[UITextField alloc]initWithFrame:CGRectMake(50, 90, self.view.frame.size.width - 100, 50)];
    self.titleField.placeholder = @" Entry title ";
    self.titleField.borderStyle = UITextBorderStyleRoundedRect;
    self.titleField.delegate = self;
    [self.view addSubview:self.titleField];
    
    self.entryField = [[UITextView alloc]initWithFrame:CGRectMake(50, 165, self.view.frame.size.width - 100, 150)];
    self.entryField.delegate = self;
    [self.view addSubview:self.entryField];
    
    self.addButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 335, 75, 50)];
    [self.addButton setTitle:@" Add " forState:UIControlStateNormal];
    [self.addButton setBackgroundColor:[UIColor textLabelColor]];
    [self.addButton addTarget:self action:@selector(addEntry:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButton];
    
    self.clearButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 335, 75, 50)];
    [self.clearButton setTitle:@ " Clear " forState:UIControlStateNormal];
    [self.clearButton setBackgroundColor:[UIColor blueColor]];
    [self.clearButton addTarget:self action:@selector(removeEntry:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    
    [self setUpTableView];
    
    
    
}

- (void)setUpTableView {
    
    
}

- (void)addEntry:(id)sender {
    
    
}

- (void)removeEntry:(id)sender {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
