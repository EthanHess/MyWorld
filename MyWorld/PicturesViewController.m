//
//  PicturesViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PicturesViewController.h"
#import "UIColor+UIColorCategory.h"

@interface PicturesViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation PicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor backgroundColor];
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, self.view.frame.size.width - 100)];
    self.image.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.image];
    
    self.saveImageButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 400, self.view.frame.size.width - 150, 50)];
    [self.saveImageButton setTitle:@" Add Image " forState:UIControlStateNormal];
    [self.saveImageButton setBackgroundColor:[UIColor blueColor]];
    [self.saveImageButton addTarget:self action:@selector(saveImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveImageButton];
    
}

- (void)saveImage:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
