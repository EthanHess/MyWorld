//
//  EntriesViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntriesViewDataSource.h"

@interface EntriesViewController : UIViewController

@property (nonatomic, strong) UITextField *titleField;
@property (nonatomic, strong) UITextView *entryField;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *clearButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) EntriesViewDataSource *dataSource;

@end
