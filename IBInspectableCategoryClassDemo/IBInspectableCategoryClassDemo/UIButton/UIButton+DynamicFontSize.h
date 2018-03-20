//
//  UIButton+DynamicFontSize.h
//  Copyright © 2017 datt. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void (^ButtonActionBlock)(NSInteger tag);

@interface UIButton(DynamicFontSize)
@property (nonatomic) IBInspectable BOOL adjustFontSize;
@property (nonatomic) IBInspectable UIColor *backgroundImageColor;

-(void)addActionHandler:(ButtonActionBlock)touchHandler;
@end
