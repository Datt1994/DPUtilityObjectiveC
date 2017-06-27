//
//  UIView+Utility.m
//
//  Created by datt on 5/30/17.
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIView+Utility.h"
#define DEVICE_FRAME [[ UIScreen mainScreen ] bounds ]
@implementation UIView(Utility)
@dynamic borderColor,borderWidth,cornerRadius,bottomLineColor,bottomLineWidth,topLineColor,topLineWidth,rightLineColor,rightLineWidth,leftLineColor,leftLineWidth;
// for Bottom Line
CGFloat bottomBorderWidth;
UIColor *bottomBorderColor;
int bottomBorderCount;

// for Top Line
CGFloat topBorderWidth;
UIColor *topBorderColor;
int topBorderCount;

// for Right Line
CGFloat rightBorderWidth;
UIColor *rightBorderColor;
int rightBorderCount;

// for Left Line
CGFloat leftBorderWidth;
UIColor *leftBorderColor;
int leftBorderCount;


-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}

-(void)setBottomLineWidth:(CGFloat)bottomLineWidth{
   bottomBorderWidth = bottomLineWidth;
    if (bottomBorderCount == 1)
    {
        [self addBottomBorderWithColor:bottomBorderColor andWidth:bottomBorderWidth];
    }
    else
    {
        bottomBorderCount++;
    }
}
-(void)setBottomLineColor:(UIColor *)bottomLineColor{
    bottomBorderColor = bottomLineColor;
    if (bottomBorderCount == 1)
    {
        [self addBottomBorderWithColor:bottomBorderColor andWidth:bottomBorderWidth];
    }
    else
    {
        bottomBorderCount++;
    }
}

-(void)setTopLineWidth:(CGFloat)topLineWidth{
    topBorderWidth = topLineWidth;
    if (topBorderCount == 1)
    {
        [self addTopBorderWithColor:topBorderColor andWidth:topBorderWidth];
    }
    else
    {
        topBorderCount++;
    }
}
-(void)setTopLineColor:(UIColor *)topLineColor{
    topBorderColor = topLineColor;
    if (topBorderCount == 1)
    {
        [self addTopBorderWithColor:topBorderColor andWidth:topBorderWidth];
    }
    else
    {
        topBorderCount++;
    }
}


-(void)setRightLineWidth:(CGFloat)rightLineWidth{
    rightBorderWidth = rightLineWidth;
    if (rightBorderCount == 1)
    {
        [self addRightBorderWithColor:rightBorderColor andWidth:rightBorderWidth];
    }
    else
    {
        rightBorderCount++;
    }
}
-(void)setRightLineColor:(UIColor *)rightLineColor{
    rightBorderColor = rightLineColor;
    if (rightBorderCount == 1)
    {
        [self addRightBorderWithColor:rightBorderColor andWidth:rightBorderWidth];
    }
    else
    {
        rightBorderCount++;
    }
}


-(void)setLeftLineWidth:(CGFloat)leftLineWidth{
    leftBorderWidth = leftLineWidth;
    if (leftBorderCount == 1)
    {
        [self addLeftBorderWithColor:leftBorderColor andWidth:leftBorderWidth];
    }
    else
    {
        leftBorderCount++;
    }
}
-(void)setLeftLineColor:(UIColor *)leftLineColor{
    leftBorderColor = leftLineColor;
    if (leftBorderCount == 1)
    {
        [self addLeftBorderWithColor:leftBorderColor andWidth:leftBorderWidth];
    }
    else
    {
        leftBorderCount++;
    }
}


- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(0, 0, DEVICE_FRAME.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    self.clipsToBounds = YES;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, DEVICE_FRAME.size.width, borderWidth);
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
