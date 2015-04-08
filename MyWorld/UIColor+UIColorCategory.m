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
    
    return [UIColor colorWithRed:(35/255.0) green:(170/255.0) blue:(150/255.0) alpha:1.0];
    
}

+ (UIColor *)labelBackground {
    
    return [UIColor colorWithRed:(50/255.0) green:(80/255.0) blue:(100/255.0) alpha:1.0];
    
}

+ (UIColor *)textLabelColor {
    
    return [UIColor colorWithRed:(30/255.0) green:(200/255.0) blue:(90/255.0) alpha:1.0];
}

+ (UIColor *)coolGreen {
    
    return [UIColor colorWithRed:(30/255.0) green:(230/255.0) blue:(20/255.0) alpha:1.0];
}

+ (UIColor *)darkGreen {
    
    return [UIColor colorWithRed:(100/255.0) green:(255/255.0) blue:(190/255.0) alpha:1.0];
}

+ (UIColor *)awesome {
    
    return [UIColor colorWithRed:(55/255.0) green:(145/255.0) blue:(225/255.0) alpha:1];
}

@end
