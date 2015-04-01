//
//  PictureController.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PictureController.h"

@implementation PictureController

+ (PictureController *)sharedInstance {
    static PictureController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PictureController new];
    });
    
    return sharedInstance;
    
}





@end
