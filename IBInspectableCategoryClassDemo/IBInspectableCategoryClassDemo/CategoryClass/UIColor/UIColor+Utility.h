//
//  UIColor+Utility.h
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 20/03/18.
//  Copyright © 2018 datt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Utility)

+ (UIColor *)randomColor ;

+ (UIColor *)colorWithHexString: (NSString *) hexString;

+ (UIColor *)colorWithR:(int)red G:(int)green B:(int)blue A:(CGFloat)alpha ;

+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height ;


@end
