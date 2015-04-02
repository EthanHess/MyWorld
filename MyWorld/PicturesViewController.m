//
//  PicturesViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 3/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PicturesViewController.h"
#import "UIColor+UIColorCategory.h"
#import "CollectionViewController.h"

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
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    else {
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    
    [self.view addSubview:self.imagePicker.view];
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, self.view.frame.size.width - 100)];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageView];
    
    self.saveImageButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 400, self.view.frame.size.width - 150, 50)];
    [self.saveImageButton setTitle:@" Add Image " forState:UIControlStateNormal];
    [self.saveImageButton setBackgroundColor:[UIColor blueColor]];
    [self.saveImageButton addTarget:self action:@selector(imagePickerController:didFinishPickingMediaWithInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveImageButton];
    
    self.savedImages = [[UIButton alloc]initWithFrame:CGRectMake(75, 475, self.view.frame.size.width - 150, 50)];
    [self.savedImages setTitle:@" Saved Images " forState:UIControlStateNormal];
    [self.savedImages setBackgroundColor:[UIColor blueColor]];
    [self.savedImages addTarget:self action:@selector(seeImages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.savedImages];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
    self.chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.imageView.image = self.chosenImage;

}



- (void)seeImages:(id)sender {
    
    CollectionViewController *cvc = [CollectionViewController new];
    [self.navigationController pushViewController:cvc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
