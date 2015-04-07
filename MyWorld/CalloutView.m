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


@implementation CalloutView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor coolGreen];
        
        self.locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 150, 50)];
        self.locationLabel.text = [NSString stringWithFormat:@"%@", self.location];
        self.locationLabel.backgroundColor = [UIColor awesome];
        [self addSubview:self.locationLabel];
        
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 75, 150, 50)];
        self.textField.placeholder = @" Location Name ";
        self.textField.backgroundColor = [UIColor whiteColor]; 
        [self addSubview:self.textField];
        
        self.seeEntries = [[UIButton alloc]initWithFrame:CGRectMake(10, 145, 70, 50)];
        [self.seeEntries setTitle:@" Entries " forState:UIControlStateNormal];
        [self.seeEntries setBackgroundColor:[UIColor awesome]];
        [self.seeEntries setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.seeEntries addTarget:self action:@selector(entriesPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.seeEntries];
        
        self.seePictures = [[UIButton alloc]initWithFrame:CGRectMake(90, 145, 70, 50)];
        [self.seePictures setTitle:@" Photos " forState:UIControlStateNormal];
        [self.seePictures setBackgroundColor:[UIColor awesome]];
        [self.seePictures setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.seePictures addTarget:self action:@selector(picturesPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.seePictures];
        
        self.cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 215, 150, 50)];
        [self.cancelButton setTitle:@" Cancel " forState:UIControlStateNormal];
        [self.cancelButton setBackgroundColor:[UIColor awesome]];
        [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        
        
    }
    
    return self;
    
}

- (void)entriesPressed:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"entriesButtonPressed" object:nil];
    

}

- (void)picturesPressed:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"picturesButtonPressed" object:nil]; 

}

- (void)cancelPressed:(id)sender {

    [self setHidden:YES];
}


@end
