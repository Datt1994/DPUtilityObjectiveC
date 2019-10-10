//
//  UIView+Utility.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIView+Utility.h"
#import <objc/runtime.h>
static void *topBorderContext = &topBorderContext;
static void *bottomBorderContext = &bottomBorderContext;
static void *leftBorderContext = &leftBorderContext;
static void *rightBorderContext = &rightBorderContext;
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
    [self addBottomBorderWithColor:[self bottomLineColor] andWidth:bottomLineWidth];
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
    [self addTopBorderWithColor:[self topLineColor] andWidth:topLineWidth];
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
    [self addRightBorderWithColor:[self rightLineColor] andWidth:rightLineWidth];
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
    [self addLeftBorderWithColor:[self leftLineColor] andWidth:leftLineWidth];
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    dispatch_async(dispatch_get_main_queue(), ^{
        CALayer *border = [CALayer layer];
        border.name = @"topBorderLayer";
        [self removePreviouslyAddedLayer:border.name];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
        [self.layer addSublayer:border];
        [self addObserver:self forKeyPath: @"bounds" options:NSKeyValueObservingOptionNew context:topBorderContext];
    });
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    dispatch_async(dispatch_get_main_queue(), ^{
        CALayer *border = [CALayer layer];
        border.name = @"bottomBorderLayer";
        [self removePreviouslyAddedLayer:border.name];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
        [self.layer addSublayer:border];
        [self addObserver:self forKeyPath: @"bounds" options:NSKeyValueObservingOptionNew context:bottomBorderContext];
    });
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    dispatch_async(dispatch_get_main_queue(), ^{
        CALayer *border = [CALayer layer];
        border.name = @"leftBorderLayer";
        [self removePreviouslyAddedLayer:border.name];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
        [self.layer addSublayer:border];
        [self addObserver:self forKeyPath: @"bounds" options:NSKeyValueObservingOptionNew context:leftBorderContext];
    });
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    dispatch_async(dispatch_get_main_queue(), ^{
        CALayer *border = [CALayer layer];
        border.name = @"rightBorderLayer";
        [self removePreviouslyAddedLayer:border.name];
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
        [self.layer addSublayer:border];
        [self addObserver:self forKeyPath: @"bounds" options:NSKeyValueObservingOptionNew context:rightBorderContext];
    });
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == topBorderContext) {
        for (CALayer *border in self.layer.sublayers) {
            if ([border.name isEqualToString:@"topBorderLayer"]) {
                [border setFrame:CGRectMake(0, 0, self.frame.size.width, border.frame.size.height)];
            }
        }
    } else if (context == bottomBorderContext) {
        for (CALayer *border in self.layer.sublayers) {
            if ([border.name isEqualToString:@"bottomBorderLayer"]) {
                [border setFrame:CGRectMake(0, self.frame.size.height - border.frame.size.height, self.frame.size.width, border.frame.size.height)];
            }
        }
    } else if (context == leftBorderContext) {
        for (CALayer *border in self.layer.sublayers) {
            if ([border.name isEqualToString:@"leftBorderLayer"]) {
                [border setFrame:CGRectMake(0, 0, border.frame.size.width, self.frame.size.height)];
            }
        }
    } else if (context == rightBorderContext) {
        for (CALayer *border in self.layer.sublayers) {
            if ([border.name isEqualToString:@"rightBorderLayer"]) {
                [border setFrame:CGRectMake(self.frame.size.width - border.frame.size.width, 0, border.frame.size.width, self.frame.size.height)];
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
- (void)removePreviouslyAddedLayer:(NSString *)name {
    if (self.layer.sublayers.count > 0) {
        for (CALayer *layer in self.layer.sublayers) {
            if ([layer.name isEqualToString:name]) {
                [layer removeFromSuperlayer];
            }
        }
    }
}

#pragma mark - Rounded Corners
- (void)roundedCornersOnTopWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerTopLeft | UIRectCornerTopRight
                  withRadious:radious];
}

- (void)roundedCornersOnTopLeftWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerTopLeft
                  withRadious:radious];
    
}

- (void)roundedCornersOnTopRightWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerTopRight
                  withRadious:radious];
}

- (void)roundedCornersOnBottomWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerBottomLeft | UIRectCornerBottomRight
                  withRadious:radious];
}

- (void)roundedCornersOnBottomLeftWithRadious:(CGFloat)radious  {
    
    [self roundedCornerOnSide:UIRectCornerBottomLeft
                  withRadious:radious];
}

- (void)roundedCornersOnBottomRightWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerBottomRight
                  withRadious:radious];
}


- (void)roundedCornersOnAllSideWithRadious:(CGFloat)radious {
    
    [self roundedCornerOnSide:UIRectCornerAllCorners
                  withRadious:radious];
}

- (void)roundedCornerOnSide:(UIRectCorner)corners withRadious:(CGFloat)radious {
    
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: [(id)self bounds]
                                           byRoundingCorners: corners
                                                 cornerRadii: (CGSize){radious, radious}].CGPath;
    
    
    [(id)self setClipsToBounds:YES];
    
}

#pragma mark - Utility
- (NSArray *)superviews {
    NSMutableArray *superviews = [[NSMutableArray alloc] init];
    
    UIView *view = self;
    UIView *superview = nil;
    while (view) {
        superview = [view superview];
        if (!superview) {
            break;
        }
        
        [superviews addObject:superview];
        view = superview;
    }
    
    return superviews;
}



- (void)fadeOut {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 0.0f;
    } completion:nil];
}


- (void)fadeOutAndRemoveFromSuperview {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}


- (void)fadeIn {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 1.0f;
    } completion:nil];
}


- (void)removeAllSubviews {
    
    [self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
}


#pragma mark - Size shortcuts

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
