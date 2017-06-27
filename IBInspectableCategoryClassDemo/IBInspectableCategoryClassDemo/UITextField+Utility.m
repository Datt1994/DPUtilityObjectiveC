//
//  UITextField+Utility.m
//
//  Created by datt on 6/23/17.
//  Copyright © 2017 datt. All rights reserved.
//

#import "UITextField+Utility.h"

@implementation UITextField(Utility)
@dynamic leftPadding,rightPadding;

-(void) setLeftPadding:(int) leftPadding
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftPadding, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void) setRightPadding:(int) rightPadding
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightPadding, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}
@end
