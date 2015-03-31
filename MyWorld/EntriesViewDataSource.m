//
//  EntriesViewDataSource.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntriesViewDataSource.h"
#import "Entry.h"

static NSString *const CellID = @"cellID";

@interface EntriesViewDataSource ()

@property (nonatomic, strong) Location *location;

@end

@implementation EntriesViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2; 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    Entry *entry = [self.location.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = entry.title;
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:24];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:@""];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0;
}


@end
