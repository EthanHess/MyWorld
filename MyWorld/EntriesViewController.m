//
//  EntriesViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntriesViewController.h"
#import "EntryController.h"
#import "UIColor+UIColorCategory.h"
#import "DetailViewController.h"

@interface EntriesViewController () <UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate>

@end

@implementation EntriesViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData]; 
}

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
    [self.clearButton addTarget:self action:@selector(clearFields:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    
    [self setUpTableView];
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.entry = [EntryController sharedInstance].entries[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}

- (void)setUpTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height - 400) style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.dataSource = [EntriesViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self.dataSource registerTableView:self.tableView];
    
    [self.view addSubview:self.tableView];
    
    
}



- (void)addEntry:(id)sender {
    
    [[EntryController sharedInstance] addEntryWithEntryTitle:self.titleField.text entryText:self.entryField.text timestamp:[NSDate date]];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Entry Added!" message:nil delegate:self cancelButtonTitle:@" Okay! " otherButtonTitles:nil, nil];
    
    [alertView show];
    
    [self clearFields]; 
    
}

- (void)clearFields:(id)sender {
    
    self.titleField.text = @"";
    self.entryField.text = @""; 
    
}

- (void)clearFields {
    
    self.titleField.text = @"";
    self.entryField.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
