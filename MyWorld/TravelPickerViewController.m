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
    
    NSArray *arrayOfCountries = [self countries];
    int randomNumber = arc4random() % [self countries].count;
//    [self shuffle:array];
    
//    NSString *country = [self shuffle:array][0];
    
    self.destinationLabel.text = [NSString stringWithFormat:@"%@", arrayOfCountries[randomNumber]];
    
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
    
    return @[@"Afghanistan",@"Albania",@"Algeria",@"Andorra",@"Angola",@"Antarctica",@"Argentina",@"Armenia",@"Aruba",@"Australia",@"Austria", @"Azerbaijan", @"Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bhutan", @"Bolivia", @"Bosnia and Herzegovina", @"Botswana", @"Brazil", @"British Virgin Islands", @"Brunei", @"Bulgaria", @"Burkina Faso", @"Burma", @"Burundi", @"Cambodia",@"Cameroon",@"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Colombia", @"Congo", @"Coasta Rica", @"Croatia", @"Cuba",@"Cyprus", @"Czech Republic", @"Denmark", @"Djibouti", @"Dominican Republic", @"Ecuador", @"Egypt", @"El Salvador", @"Estonia", @"Ethiopia",@"Fiji",@"Finland",@"France",@"French Guiana",@"French Polynesia", @"Gabon",@"Gambia",@"Georgia", @"Germany", @"Ghana", @"Greece", @"Greenland", @"Guam", @"Guatemala", @"Guyana",@"Haiti",@"Honduras",@"Hong Kong", @"Hungary", @"Iceland", @"India", @"Indonesia", @"Iran",@"Iraq",@"Ireland", @"Israel", @"Italy", @"Ivory Coast", @"Jamaica", @"Japan",@"Jordan", @"Kazakhstan", @"Kenya", @"Kuwait", @"Kyrgystan", @"Laos", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libya", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macau", @"Macedonia", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Mauritania", @"Mexico", @"Moldova", @"Mongolia", @"Morocco", @"Mozambique", @"Namibia", @"Nepal", @"Netherlands", @"New Zealand", @"Nicaragua", @"Niger", @"Nigeria", @"North Korea", @"Norway", @"Oman", @"Pakistan", @"Panama", @"Paraguay", @"Peru", @"Philippines", @"Poland", @"Portugal", @"Puerto Rico", @"Qatar", @"Romania", @"Russia", @"Rwanda", @"Samoa", @"Saudi Arabia", @"Senegal", @"Serbia and Montenegro", @"Sierra Leone", @"Singapore", @"Slovakia", @"Slovenia", @"Somalia", @"South Africa", @"South Korea", @"Spain", @"Sri Lanka", @"Sudan", @"Swaziland", @"Sweden", @"Switzerland", @"Syria", @"Taiwan", @"Tajikistan", @"Tanzania", @"Thailand", @"Togo", @"Tunisia", @"Turkey", @"Turkmenistan", @"Tuvalu", @"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"Uruguay", @"Uzbekistan", @"Venezuela", @"Vietnam", @"Yemen", @"Zambia", @"Zimbabwe"];
    
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
