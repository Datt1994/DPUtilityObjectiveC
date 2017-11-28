//
//  UIViewController+StatusBarStyle.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "UIViewController+StatusBarStyle.h"
#import "UITextField+Utility.h"

@implementation UIViewController (StatusBarStyle)
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL shouldChange = YES;
    
    if(textField.maxLength){
        // Prevent crashing undo bug – see note below.
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        shouldChange = (newLength > textField.maxLength) ? NO : YES;
        if(!shouldChange){
            return shouldChange;
        }
    }
    return shouldChange;
}
@end
