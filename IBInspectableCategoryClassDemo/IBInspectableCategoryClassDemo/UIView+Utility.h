//
//  UIView+Utility.h
//
//  Created by datt on 5/30/17.
//  Copyright © 2017 datt. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView(Utility)
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (atomic) IBInspectable UIColor *topLineColor;
@property (atomic) IBInspectable CGFloat topLineWidth;
@property (atomic) IBInspectable UIColor *bottomLineColor;
@property (atomic) IBInspectable CGFloat bottomLineWidth;
@property (atomic) IBInspectable UIColor *rightLineColor;
@property (atomic) IBInspectable CGFloat rightLineWidth;
@property (atomic) IBInspectable UIColor *leftLineColor;
@property (atomic) IBInspectable CGFloat leftLineWidth;
- (void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
@end
