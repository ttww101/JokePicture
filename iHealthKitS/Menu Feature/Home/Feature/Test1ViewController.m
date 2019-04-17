//
//  Test1ViewController.m
//  iHealthS
//
//  Created by Wu on 2019/4/9.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

#import "Test1ViewController.h"
#import "UIView+Constraint.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton new];
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button constraintsCenterX:self.view toLayoutAttribute:NSLayoutAttributeCenterX];
    [button constraintsCenterY:self.view toLayoutAttribute:NSLayoutAttributeCenterY];
    [button addTarget:self action:@selector(testvcDismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


- (void)testvcDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
