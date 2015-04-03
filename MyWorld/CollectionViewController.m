//
//  CollectionViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CollectionViewController.h"
#import "UIColor+UIColorCategory.h"
#import "Location.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor coolGreen];
    
    layout.sectionInset = UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0);
    
    self.dataSource = [CollectionViewDataSource new];
    self.collectionView.dataSource = self.dataSource;
    self.collectionView.delegate = self;
    [self.dataSource registerCollectionView:self.collectionView];
    [self.view addSubview:self.collectionView];
    
    
}

- (void)updateWithLocation:(Location *)location {
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((self.view.frame.size.width / 2) - 8,180);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@" Delete " message:@" Are you sure you want to delete this picture? " delegate:self cancelButtonTitle:@" Cancel " otherButtonTitles:@" Yes ", nil];
    [alertView show];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
