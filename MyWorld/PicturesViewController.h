//
//  PicturesViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicturesViewController : UIViewController

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIButton *saveImageButton;
@property (nonatomic, strong) UIButton *savedImages; 

@end
