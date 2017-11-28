//
//  UITextField+Utility.m
//  Copyright © 2017 datt. All rights reserved.
//
#import <objc/runtime.h>
#import "UITextField+Utility.h"
static void *MaxLengthKey;
@implementation UITextField(Utility)
@dynamic leftPadding,rightPadding,maxLength,adjustFontSize;

-(void) setLeftPadding:(int) leftPadding {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftPadding, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void) setRightPadding:(int) rightPadding {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightPadding, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(void)setAdjustFontSize:(BOOL)adjustFontSize{
    if (adjustFontSize)
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.font = [self.font fontWithSize:self.font.pointSize*(screenBounds.size.width/320)];// if you design with iphone 6, use 375 instead of 320 and iphone 6 plus, use 414
        
    }
}

-(void)setMaxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, &MaxLengthKey, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger)maxLength {
    return [objc_getAssociatedObject(self, &MaxLengthKey) integerValue];
}

@end
