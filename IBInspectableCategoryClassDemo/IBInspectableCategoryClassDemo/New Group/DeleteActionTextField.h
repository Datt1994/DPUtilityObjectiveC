//
//  ConfirmEmailTextField.h
//  Copyright © 2017 datt. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol DeleteActionTextFieldDelegate <NSObject>
@optional
- (void)textFieldDidDelete:(UITextField *)textField;
@end

@interface DeleteActionTextField : UITextField<UIKeyInput>

//create "myDelegate"
@property (nonatomic, assign) IBOutlet id<DeleteActionTextFieldDelegate> myDelegate;
@end

