//
//  TravelPickerViewController.m
//  MyWorld
//
//  Created by Ethan Hess on 4/5/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "TravelPickerViewController.h"
#import "UIColor+UIColorCategory.h"
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

@interface TravelPickerViewController ()

@property (nonatomic, strong) UILabel *destinationLabel;
@property (nonatomic, strong) UIButton *pickerButton;

@end

@implementation TravelPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor awesome];
    
    [self setUpDestinationLabel];
    [self setUpPickerButton];
    
    
}

- (void)setUpDestinationLabel {
    
    self.destinationLabel = [[UILabel alloc] initWithFrame: CGRectMake(25, self.view.frame.size.height/2 - 150, 300, 150)];
    
    self.destinationLabel.font = [UIFont fontWithName:@"Chalkduster" size:60];
    self.destinationLabel.textColor = [UIColor brownColor];
    self.destinationLabel.textAlignment = NSTextAlignmentCenter;
    self.destinationLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.destinationLabel];
    
    
}

- (void)setUpPickerButton {
    
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    self.pickerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.pickerButton.frame = CGRectMake(25, screenHeight - 150, screenWidth - 50, 75);
    [self.pickerButton setTitle:@"Pick a Country!" forState:UIControlStateNormal];
    [self.pickerButton setBackgroundColor:[UIColor coolGreen]];
    [self.pickerButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:34]];
    [self.pickerButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.pickerButton addTarget:self action:@selector(newCountryButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.pickerButton];
    
}

- (void)newCountryButtonPressed {
    
    self.destinationLabel.text = @"Where to?";
    [self growsOnTouch:self.destinationLabel withDuration:2];
    [self.pickerButton setEnabled:NO];
    [self.pickerButton setTitle:@"Drumroll!!" forState:UIControlStateDisabled];
    [self.pickerButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    [self performSelector:@selector(updateDestinationLabel) withObject:nil afterDelay:2];
    
}

- (void)updateDestinationLabel {
    
    NSArray *array = [self countries];
    
    [self shuffle:array];
    
    NSString *country = array[0];
        
    self.destinationLabel.text = [NSString stringWithFormat:@"%@", country];
    
    [self.pickerButton setEnabled:YES];
    
}


- (void)growsOnTouch:(UIView *)view withDuration:(float)duration {
    
    CGAffineTransform bigger = CGAffineTransformMakeScale(10, 10);
    CGAffineTransform smaller = CGAffineTransformMakeScale(1, 1);
    CGAffineTransform rotate = CGAffineTransformMakeRotation(radians(180));
    [UIView animateWithDuration:duration animations:^{
        view.transform = bigger;
        view.transform = rotate;
        view.transform = smaller;
    }];
}



- (NSArray *)countries {
    
    return @[@"Afghanistan",@"Albania",@"Algeria",@"Andorra",@"Angola",@"Antarctica",@"Argentina",@"Armenia",@"Aruba",@"Australia",@"Austria", @"Azerbaijan", @"United States", @"Canada", @"Mexico", @"Spain"];
    
}

- (NSArray *)shuffle:(NSArray *)array {
    
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:array];
    
    NSInteger count = [newArray count];
    for (NSInteger i = 0; i < 0; ++i) {
        
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [newArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    return [NSArray arrayWithArray:newArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
