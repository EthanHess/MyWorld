//
//  CollectionViewDataSource.m
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CollectionViewDataSource.h"
#import "PictureController.h"
#import "UIColor+UIColorCategory.h"

static NSString const *CellID = @"Cell";

@implementation CollectionViewDataSource

- (void)registerCollectionView:(UICollectionView *)collectionView {
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [PictureController sharedInstance].pictures.count;
    
}

- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    
    NSArray *subviews = [cell.contentView subviews];
    
    for (UIView *view in subviews) {
        [view removeFromSuperview];
    }
    
    Picture *thumbnail =[PictureController sharedInstance].pictures[indexPath.row];
    UIImage *image = [UIImage imageWithData:thumbnail.image];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    
    imageView.frame = cell.bounds;
    [cell addSubview:imageView];
    cell.backgroundColor = [UIColor backgroundColor];
    
    return cell;
    
}


@end
