//
//  UIButton+DynamicFontSize.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIButton+DynamicFontSize.h"

@implementation UIButton(DynamicFontSize)
@dynamic adjustFontSize;
-(void)setAdjustFontSize:(BOOL)adjustFontSize{
    if (adjustFontSize)
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:self.titleLabel.font.pointSize*(screenBounds.size.width/320)];// if you design with iphone 6, use 375 instead of 320 and iphone 6 plus, use 414
        
    }
}
@end
