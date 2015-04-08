//
//  CalloutView.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CalloutView.h"
#import "UIColor+UIColorCategory.h"
#import "EntriesViewController.h"
#import "PicturesViewController.h"
#import "LocationController.h"


@implementation CalloutView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor coolGreen];
        
        NSString *loc = [NSString stringWithFormat:@"%@", self.textField.text];
        
        self.locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 150, 35)];
        self.locationLabel.text = [NSString stringWithFormat:@"%@", loc];
        self.locationLabel.backgroundColor = [UIColor awesome];
        [self addSubview:self.locationLabel];
        
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 60, 150, 50)];
        self.textField.placeholder = @" Location Name ";
        self.textField.backgroundColor = [UIColor whiteColor]; 
        [self addSubview:self.textField];
        
        self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 130, 150, 35)];
        [self.saveButton setTitle:@" Save Location " forState:UIControlStateNormal];
        [self.saveButton setBackgroundColor:[UIColor backgroundColor]];
        [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.saveButton addTarget:self action:@selector(saveLocation:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.saveButton];
        
        self.seeEntries = [[UIButton alloc]initWithFrame:CGRectMake(10, 180, 70, 35)];
        [self.seeEntries setTitle:@" Entries " forState:UIControlStateNormal];
        [self.seeEntries setBackgroundColor:[UIColor awesome]];
        [self.seeEntries setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.seeEntries addTarget:self action:@selector(entriesPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.seeEntries];
        
        self.seePictures = [[UIButton alloc]initWithFrame:CGRectMake(90, 180, 70, 35)];
        [self.seePictures setTitle:@" Photos " forState:UIControlStateNormal];
        [self.seePictures setBackgroundColor:[UIColor awesome]];
        [self.seePictures setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.seePictures addTarget:self action:@selector(picturesPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.seePictures];
        
        self.cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 230, 70, 35)];
        [self.cancelButton setTitle:@" Cancel " forState:UIControlStateNormal];
        [self.cancelButton setBackgroundColor:[UIColor awesome]];
        [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        self.removeButton = [[UIButton alloc]initWithFrame:CGRectMake(90, 230, 70, 35)];
        [self.removeButton setTitle:@" Delete " forState:UIControlStateNormal];
        [self.removeButton setBackgroundColor:[UIColor awesome]];
        [self.removeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.removeButton addTarget:self action:@selector(removeLocation:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.removeButton];
        
        
        
        
    }
    
    return self;
    
}

- (void)entriesPressed:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"entriesButtonPressed" object:nil];
    

}

- (void)picturesPressed:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"picturesButtonPressed" object:nil]; 

}

- (void)removeLocation:(id)sender { 
    
    [[LocationController sharedInstance] removeLocation:self.location];
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeButtonPressed" object:nil];
}

- (void)saveLocation:(id)sender {
    
    self.locationLabel.text = self.textField.text; 
}

- (void)cancelPressed:(id)sender {

    [self setHidden:YES];
}


@end
