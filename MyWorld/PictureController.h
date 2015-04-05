//
//  PictureController.h
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"
@import UIKit;

@interface PictureController : NSObject

@property (nonatomic, strong) NSArray *pictures;

+ (PictureController *)sharedInstance;

- (NSArray *)pictures;

- (void)addPictureWithImage:(UIImage *)image;

- (void)removePicture:(Picture *)picture;


@end
