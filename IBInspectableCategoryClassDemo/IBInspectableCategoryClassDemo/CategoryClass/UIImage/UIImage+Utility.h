//
//  UIImage+Utility.h
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 20/03/18.
//  Copyright © 2018 datt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Utility)

+ (UIImage *)imageFromUIColor:(UIColor *)color ;

+ (UIImage *)screenshot ;

- (UIImage*)blurredImage:(CGFloat)blurAmount ;

- (UIImage*)scaleToSize:(CGSize)newSize ;

- (UIImage *)croppedImage:(CGRect)bounds ;

@end
