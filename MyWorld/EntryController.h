//
//  EntryController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h" 
#import "Entry.h"
#import "Location.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;
@property (nonatomic, strong) Entry *entry;
@property (nonatomic, strong) Location *location;

+ (EntryController *)sharedInstance;

- (void)addEntryWithEntryTitle:(NSString *)title entryText:(NSString *)entryText timestamp: (NSDate *)timestamp; 

- (void)removeEntry:(Entry *)entry;

- (void)synchronize; 

@end
