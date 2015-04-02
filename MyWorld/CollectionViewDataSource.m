//
//  CollectionViewDataSource.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CollectionViewDataSource.h"
#import "UIColor+UIColorCategory.h"

static NSString const *CellID = @"Cell";

@implementation CollectionViewDataSource

- (void)registerCollectionView:(UICollectionView *)collectionView {
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
    
}

- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    
    NSArray *subviews = [cell.contentView subviews];
    
    for (UIView *view in subviews) {
        [view removeFromSuperview];
    }
    
    
//    UIImage *image = [UIImage imageNamed:@""];
//    
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
//    
//    imageView.frame = cell.bounds;
    
    cell.backgroundColor = [UIColor backgroundColor];
    
    return cell;
    
}


@end
