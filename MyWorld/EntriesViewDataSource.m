//
//  EntriesViewDataSource.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntriesViewDataSource.h"
#import "Entry.h"
#import "EntryController.h"
#import "UIColor+UIColorCategory.h"

static NSString *const CellID = @"cellID";

@interface EntriesViewDataSource ()

@property (nonatomic, strong) Location *location;

@end

@implementation EntriesViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].entries.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];
    
    
    Entry *entry = [[EntryController sharedInstance].entries objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy -- HH:mm"];
//    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:162000];
    NSDate *date = entry.timestamp;
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    cell.textLabel.text = entry.title;
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", formattedDateString];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Chalkduster" size:12];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
//  cell.imageView.image = [UIImage imageNamed:@""];
    cell.backgroundColor = [UIColor backgroundColor];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        
        [[EntryController sharedInstance] removeEntry:[EntryController sharedInstance].entries[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [tableView endUpdates];
    }
    
    
    
}




@end
