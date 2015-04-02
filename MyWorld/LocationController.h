//
//  LocationController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationController : NSObject

@property (nonatomic, strong, readonly) NSArray *locations;

+ (LocationController *)sharedInstance; 

@end
