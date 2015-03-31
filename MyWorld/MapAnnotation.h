//
//  MapAnnotation.h
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface MapAnnotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSArray *pictures;
@property (nonatomic, strong) NSArray *entries;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
