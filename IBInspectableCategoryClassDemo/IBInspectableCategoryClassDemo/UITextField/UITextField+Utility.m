//
//  UITextField+Utility.m
//  Copyright © 2017 datt. All rights reserved.
//
#import <objc/runtime.h>
#import "UITextField+Utility.h"
static void *MaxLengthKey;
@implementation UITextField(Utility)
@dynamic leftPadding,rightPadding,leftImage,rightImage,placeholderColor,maxLength,adjustFontSize;

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

-(void) setLeftImage:(UIImage *) leftImage {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImageView *imgforLeft=[[UIImageView alloc] initWithImage:leftImage];
        if (imgforLeft.frame.size.height > self.frame.size.height || imgforLeft.frame.size.width > self.frame.size.height) {
            [imgforLeft setContentMode:UIViewContentModeScaleAspectFit];
        } else {
            [imgforLeft setContentMode:UIViewContentModeCenter];
        }
        imgforLeft.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
        self.leftView=imgforLeft;
        self.leftViewMode=UITextFieldViewModeAlways;
    });
}
-(void) setRightImage:(UIImage *) rightImage {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImageView *imgforRight=[[UIImageView alloc] initWithImage:rightImage];
        if (imgforRight.frame.size.height > self.frame.size.height || imgforRight.frame.size.width > self.frame.size.height) {
            [imgforRight setContentMode:UIViewContentModeScaleAspectFit];
        } else {
            [imgforRight setContentMode:UIViewContentModeCenter];
        }
        imgforRight.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
        self.rightView=imgforRight;
        self.rightViewMode=UITextFieldViewModeAlways;
    });
}

-(void) setPlaceholderColor:(UIColor *)placeholderColor {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
        }
    });
}
-(void)setAdjustFontSize:(BOOL)adjustFontSize{
    if (adjustFontSize)
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.font = [self.font fontWithSize:self.font.pointSize*(screenBounds.size.width/320)];// if you design with iphone 6, use 375 instead of 320 and iphone 6 plus, use 414
        
    }
}



-(NSInteger)maxLength {
    return [objc_getAssociatedObject(self, &MaxLengthKey) integerValue];
}
-(void)setMaxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, &MaxLengthKey, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextDidChange {
    NSString *toBeString = self.text;
    
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    
    if ( (!position ||!selectedRange) && (self.maxLength > 0 && toBeString.length > self.maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}
@end
