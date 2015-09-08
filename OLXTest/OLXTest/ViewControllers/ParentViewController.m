//
//  ParentViewController.m
//  OLXTest
//
//  Created by Federico Jordán on 7/9/15.
//  Copyright (c) 2015 Federico Jordán. All rights reserved.
//

#import "ParentViewController.h"

@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
}

@end
