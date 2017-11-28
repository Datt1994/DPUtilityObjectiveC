//
//  ViewController.m
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 6/26/17.
//  Copyright © 2017 datt. All rights reserved.
//

#import "ViewController.h"
#import "DeleteActionTextField.h"
#import "UIAlertController+Window.h"
@interface ViewController ()<DeleteActionTextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidDelete:(UITextField *)textField {
    [self alertWithTitle:@"delete"];
}
- (IBAction)btnShowAction:(id)sender {
    [self alertWithTitle:@"Show button Action"];
}
- (void)alertWithTitle:(NSString*)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert show];
}
@end
