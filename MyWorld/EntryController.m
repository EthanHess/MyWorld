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

- (NSArray *)entries {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
    
}

- (void)addEntryWithEntryTitle:(NSString *)title entryText:(NSString *)entryText timestamp: (NSDate *)timestamp {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.entryText = entryText;
    entry.timestamp = timestamp;
    
    [self synchronize];
    
    
}

- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry];
    
    [self synchronize]; 
    
}


- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL]; 
}

@end
