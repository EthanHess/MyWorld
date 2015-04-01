//
//  CalloutView.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CalloutView.h"
#import "UIColor+UIColorCategory.h"


@implementation CalloutView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor coolGreen];
        
        self.seeEntries = [[UIButton alloc]initWithFrame:CGRectMake(15, 15, 150, 50)];
        [self.seeEntries setTitle:@" See Entries " forState:UIControlStateNormal];
        [self.seeEntries setBackgroundColor:[UIColor backgroundColor]];
        [self.seeEntries setTitleColor:[UIColor labelBackground] forState:UIControlStateNormal];
        [self addSubview:self.seeEntries];
        
        self.seePictures = [[UIButton alloc]initWithFrame:CGRectMake(15, 75, 150, 50)];
        [self.seePictures setTitle:@" See Pictures " forState:UIControlStateNormal];
        [self.seePictures setBackgroundColor:[UIColor backgroundColor]];
        [self.seePictures setTitleColor:[UIColor labelBackground] forState:UIControlStateNormal];
        [self addSubview:self.seePictures]; 
        
        
    }
    
    return self;
    
}


@end
