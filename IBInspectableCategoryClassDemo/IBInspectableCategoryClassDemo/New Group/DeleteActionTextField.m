//
//  ConfirmEmailTextField.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "DeleteActionTextField.h"

@implementation DeleteActionTextField

- (void)deleteBackward {
    [super deleteBackward];
    
    if ([_myDelegate respondsToSelector:@selector(textFieldDidDelete:)]){
        [_myDelegate textFieldDidDelete:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
