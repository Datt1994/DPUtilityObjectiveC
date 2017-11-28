//
//  UIView+Utility.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIView+Utility.h"
#import <objc/runtime.h>
static char bottomLineColorKey,topLineColorKey,rightLineColorKey,leftLineColorKey;
@implementation UIView(Utility)
@dynamic borderColor,borderWidth,cornerRadius,bottomLineWidth,topLineWidth,rightLineWidth,leftLineWidth;

-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}
// for Bottom Line
- (UIColor *)bottomLineColor {
    return objc_getAssociatedObject(self, &bottomLineColorKey);
}
- (void)setBottomLineColor:(UIColor *)bottomLineColor {
    objc_setAssociatedObject(self, &bottomLineColorKey,
                             bottomLineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setBottomLineWidth:(CGFloat)bottomLineWidth {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self addBottomBorderWithColor:[self bottomLineColor] andWidth:bottomLineWidth];
    });
}
// for top Line
- (UIColor *)topLineColor {
    return objc_getAssociatedObject(self, &topLineColorKey);
}
- (void)setTopLineColor:(UIColor *)topLineColor {
    objc_setAssociatedObject(self, &topLineColorKey,
                             topLineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setTopLineWidth:(CGFloat)topLineWidth{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self addTopBorderWithColor:[self topLineColor] andWidth:topLineWidth];
    });
}
// for right Line
- (UIColor *)rightLineColor {
    return objc_getAssociatedObject(self, &rightLineColorKey);
}
-(void)setRightLineColor:(UIColor *)rightLineColor {
    objc_setAssociatedObject(self, &rightLineColorKey,
                             rightLineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setRightLineWidth:(CGFloat)rightLineWidth{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self addRightBorderWithColor:[self rightLineColor] andWidth:rightLineWidth];
    });
}
// for left Line
-(UIColor *)leftLineColor {
    return objc_getAssociatedObject(self, &leftLineColorKey);
}
-(void)setLeftLineColor:(UIColor *)leftLineColor{
    objc_setAssociatedObject(self, &leftLineColorKey,
                             leftLineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setLeftLineWidth:(CGFloat)leftLineWidth{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self addLeftBorderWithColor:[self leftLineColor] andWidth:leftLineWidth];
    });
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}
@end
