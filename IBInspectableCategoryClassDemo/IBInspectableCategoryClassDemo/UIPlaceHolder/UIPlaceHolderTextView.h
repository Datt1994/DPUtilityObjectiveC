//
//  UIPlaceHolderTextView.h
//  Copyright © 2017 datt. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UITextViewFixed : UITextView
@end

IB_DESIGNABLE
@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) IBInspectable NSString *placeholder;
@property (nonatomic, retain) IBInspectable UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
