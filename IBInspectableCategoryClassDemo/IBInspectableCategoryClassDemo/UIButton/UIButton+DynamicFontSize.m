//
//  UIButton+DynamicFontSize.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIButton+DynamicFontSize.h"
#import <objc/runtime.h>
#import "UIImage+Utility.h"

static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton(DynamicFontSize)
@dynamic adjustFontSize,backgroundImageColor;
-(void)setAdjustFontSize:(BOOL)adjustFontSize{
    if (adjustFontSize)
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:self.titleLabel.font.pointSize*(screenBounds.size.width/320)];// if you design with iphone 6, use 375 instead of 320 and iphone 6 plus, use 414
        
    }
}
- (void)setbackgroundImageColor:(UIColor *)backgroundImageColor
{
    [self setBackgroundImage:[UIImage imageFromUIColor:backgroundImageColor] forState:UIControlStateNormal];
}


-(void)addActionHandler:(ButtonActionBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)blockActionTouched:(UIButton *)btn{
    ButtonActionBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}
@end
