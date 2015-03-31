//
//  EntryController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    
    return sharedInstance;
    
}

- (void)addEntryWithEntryTitle:(NSString *)title entryText:(NSString *)entryText timestamp: (NSDate *)timestamp toLocation:(Location *)location {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.locations = location;
    entry.title = title;
    entry.entryText = entryText;
    entry.timestamp = timestamp;
    
    [self synchronize];
    
    
}

- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry];
    
}


- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL]; 
}

@end
