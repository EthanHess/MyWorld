//
//  CollectionViewDataSource.h
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface CollectionViewDataSource : NSObject <UICollectionViewDataSource>

- (void)registerCollectionView:(UICollectionView *)collectionView;

@end
