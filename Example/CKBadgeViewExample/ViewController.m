//
//  ViewController.m
//  CKBadgeViewExample
//
//  Created by Enix Yu on 14/2/2017.
//  Copyright © 2017 RobotBros. All rights reserved.
//

#import <CKBadgeView/UIView+Badge.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btn setBackgroundImage:[UIImage imageNamed:@"msg"] forState:UIControlStateNormal];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = btnItem;
    
    // Add a red badge with default values
    [btn addBadge];
    
    
    UIButton *lbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"msg"] forState:UIControlStateNormal];
    
    UIBarButtonItem *lbtnItem = [[UIBarButtonItem alloc] initWithCustomView:lbtn];
    self.navigationItem.leftBarButtonItem = lbtnItem;
    
    // Add a red badge with customize values
    [lbtn addBadgeWithContent:@"2"
                  contentFont:[UIFont fontWithName:@"HelveticaNeue" size:12.0]
                 contentColor:[UIColor whiteColor]
                   badgeColor:[UIColor blueColor]
                       offset:CGPointMake(-2, 3)
                  badgeRadius:10.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
