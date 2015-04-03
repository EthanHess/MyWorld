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
    
    return [UIColor colorWithRed:0.1 green:0.2 blue:0.5 alpha:0.5];
    
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

@end
