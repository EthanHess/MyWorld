//
//  MapAnnotation.m
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "MapAnnotation.h"
#import "CalloutView.h"

@implementation MapAnnotation
@synthesize coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        CalloutView *calloutView = [CalloutView new];
        [self addSubview:calloutView];
        
    } else {
        
    }
    
}

@end
