//
//  CalloutView.h
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface CalloutView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField; 
@property (nonatomic, strong) UIButton *seeEntries;
@property (nonatomic, strong) UIButton *seePictures;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *removeButton;
@property (nonatomic, strong) UILabel *locationLabel; 
@property (nonatomic, strong) Location *location; 

@end
