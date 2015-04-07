//
//  PicturesViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface PicturesViewController : UIViewController

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *chosenImage;
@property (nonatomic, strong) UIButton *searchImageButton;
@property (nonatomic, strong) UIButton *savePictureButton;
@property (nonatomic, strong) UIButton *savedImages;
@property (nonatomic, strong) Location *location;

@end
