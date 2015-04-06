//
//  UIColor+UIColorCategory.m
//  MyWorld
//
//  Created by Ethan Hess on 3/29/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "UIColor+UIColorCategory.h"

@implementation UIColor (UIColorCategory)

+ (UIColor *)backgroundColor {
    
    return [UIColor colorWithRed:(35/255.0) green:(170/255.0) blue:(150/255.0) alpha:0.5];
    
}

+ (UIColor *)labelBackground {
    
    return [UIColor colorWithRed:0.3 green:0.35 blue:0.8 alpha:1.0];
    
}

+ (UIColor *)textLabelColor {
    
    return [UIColor colorWithRed:0.2 green:0.8 blue:0.4 alpha:1.0];
}

+ (UIColor *)coolGreen {
    
    return [UIColor colorWithRed:0.4 green:0.9 blue:0.2 alpha:1.0]; 
}

+ (UIColor *)darkGreen {
    
    return [UIColor colorWithRed:0.5 green:0.7 blue:0.85 alpha:1.0];
}

+ (UIColor *)awesome {
    
    return [UIColor colorWithRed:(55/255.0) green:(145/255.0) blue:(225/255.0) alpha:1];
}

@end
