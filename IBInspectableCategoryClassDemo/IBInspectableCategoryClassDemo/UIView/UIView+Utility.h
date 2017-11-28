//
//  UIView+Utility.h
//  Copyright © 2017 datt. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView(Utility)
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable UIColor *topLineColor;
@property (nonatomic) IBInspectable CGFloat topLineWidth;
@property (nonatomic) IBInspectable UIColor *bottomLineColor;
@property (nonatomic) IBInspectable CGFloat bottomLineWidth;
@property (nonatomic) IBInspectable UIColor *rightLineColor;
@property (nonatomic) IBInspectable CGFloat rightLineWidth;
@property (nonatomic) IBInspectable UIColor *leftLineColor;
@property (nonatomic) IBInspectable CGFloat leftLineWidth;
- (void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
@end
