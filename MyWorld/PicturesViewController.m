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
#import "PictureController.h"

@interface PicturesViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation PicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor backgroundColor];
    
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.delegate = self;
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    else {
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    

    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, self.view.frame.size.width - 100)];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageView];
    
    self.searchImageButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 400, self.view.frame.size.width - 150, 50)];
    [self.searchImageButton setTitle:@" Add Image " forState:UIControlStateNormal];
    [self.searchImageButton setBackgroundColor:[UIColor blueColor]];
    [self.searchImageButton addTarget:self action:@selector(presentImagePicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchImageButton];
    
    self.savePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 475, self.view.frame.size.width - 150, 50)];
    [self.savePictureButton setTitle:@" Save Image " forState:UIControlStateNormal];
    [self.savePictureButton setBackgroundColor:[UIColor blueColor]];
    [self.savePictureButton addTarget:self action:@selector(saveImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.savePictureButton];
    
    self.savedImages = [[UIButton alloc]initWithFrame:CGRectMake(75, 550, self.view.frame.size.width - 150, 50)];
    [self.savedImages setTitle:@" Image Archives " forState:UIControlStateNormal];
    [self.savedImages setBackgroundColor:[UIColor blueColor]];
    [self.savedImages addTarget:self action:@selector(seeImages:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.savedImages];
    
}


- (void)presentImagePicker:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
        
    self.chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = self.chosenImage;
        
    [picker dismissViewControllerAnimated:YES completion:NULL];
    

}

- (void)saveImage:(id)sender {
    
    [[PictureController sharedInstance] addPictureWithImage:self.chosenImage];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@" Image Saved! " message:nil delegate:self cancelButtonTitle:@" Okay! " otherButtonTitles:nil, nil];
    
    [alertView show]; 
    
//    CollectionViewController *collectionViewController;
//    
//    [self.navigationController pushViewController:collectionViewController animated:YES];
    
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
