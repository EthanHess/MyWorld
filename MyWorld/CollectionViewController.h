//
//  CollectionViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 4/1/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewDataSource.h"

@interface CollectionViewController : UIViewController <UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CollectionViewDataSource *dataSource; 

@end
