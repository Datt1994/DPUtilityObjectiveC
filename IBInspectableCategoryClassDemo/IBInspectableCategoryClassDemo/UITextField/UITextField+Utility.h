//
//  UITextField+Utility.h
//  Copyright © 2017 datt. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UITextField(Utility) <UITextFieldDelegate>
@property (nonatomic) IBInspectable int leftPadding;
@property (nonatomic) IBInspectable int rightPadding;
@property (nonatomic) IBInspectable UIColor *placeholderColor;
@property (nonatomic) IBInspectable NSInteger maxLength;
@property (nonatomic) IBInspectable UIImage *leftImage;
@property (nonatomic) IBInspectable UIImage *rightImage;
@property (nonatomic) IBInspectable BOOL adjustFontSize;
@end
