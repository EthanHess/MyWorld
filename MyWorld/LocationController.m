//
//  LocationController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LocationController.h"
#import "Stack.h"
@import CoreData;

@implementation LocationController

+ (LocationController *)sharedInstance {
    static LocationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [LocationController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)locations {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
    
}

- (void)addLocationWithName:(NSString *)name date:(NSDate *)date latitude:(NSString *)latitude longitude:(NSString *)longitude {
    
    Location *location = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    location.name = name;
    location.date = date;
    location.latitude = latitude;
    location.longitute = longitude;
    
    [self synchronize];
    
    [[LocationController sharedInstance].locations arrayByAddingObject:location];
    
    
}



- (void)addLocationWithPicture:(Picture *)picture toLocation:(Location *)loc {
    
    Picture *pic = [NSEntityDescription insertNewObjectForEntityForName:@"Picture" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    
    
    
    
    
}

- (void)addLocationWithEntry:(Entry *)entry toLocation:(Location *)loc {
    
    
    
    
}


- (void)removeLocation:(Location *)location {
    
    [location.managedObjectContext deleteObject:location];
    
    [self synchronize];
    
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL]; 
}

@end
