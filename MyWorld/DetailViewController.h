//
//  DetailViewController.h
//  MyWorld
//
//  Created by Ethan Hess on 3/31/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeStampLabel;
@property (nonatomic, strong) UILabel *entryLabel;
@property (nonatomic, strong) Entry *entry;

@end
