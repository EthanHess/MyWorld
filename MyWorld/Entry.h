//
//  Entry.h
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * entryText;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Location *locations;

@end
