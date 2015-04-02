//
//  Picture.h
//  MyWorld
//
//  Created by Ethan Hess on 4/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Picture : NSManagedObject

@property (nonatomic, retain) NSData * image;

@end
