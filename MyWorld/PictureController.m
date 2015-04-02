//
//  PictureController.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PictureController.h"
#import "Stack.h"


@implementation PictureController

+ (PictureController *)sharedInstance {
    static PictureController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PictureController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)pictures {

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@""];

    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];

    return objects;
    
}

- (void)addPictureWithImage:(UIImage *)image {
    
//    NSData* data = UIImageJPEGRepresentation(image, COMPRESSION_QUALITY);
    
    NSData *data = [NSData new];
    
    Picture *picture = [NSEntityDescription insertNewObjectForEntityForName:@"Picture" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    picture.image = data;
    
    //^^Fix here, make sure method gets passed data!
    
    [self synchronize];

}

- (void)removePicture:(Picture *)picture {
    
    [picture.managedObjectContext deleteObject:picture];
    
    [self synchronize]; 
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}



@end
