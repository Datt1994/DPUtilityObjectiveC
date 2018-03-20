//
//  UIView+Utility.h
//  Copyright © 2017 datt. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView(Utility)
#pragma mark - Borders
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

#pragma mark - Rounded Corners
- (void)roundedCornersOnTopWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnTopLeftWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnTopRightWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnBottomWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnBottomLeftWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnBottomRightWithRadious:(CGFloat)radious ;

- (void)roundedCornersOnAllSideWithRadious:(CGFloat)radious ;


#pragma mark - Utility
- (NSArray *)superviews ;

- (void)fadeOut ;

- (void)fadeOutAndRemoveFromSuperview ;

- (void)fadeIn ;

- (void)removeAllSubviews ;

#pragma mark - Size shortcuts

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@end
