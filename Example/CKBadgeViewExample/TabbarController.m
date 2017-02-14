//
//  TabbarController.m
//  CKBadgeViewExample
//
//  Created by Enix Yu on 14/2/2017.
//  Copyright © 2017 RobotBros. All rights reserved.
//

#import "TabbarController.h"
#import <CKBadgeView/UIView+Badge.h>

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar.items
     enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         obj.badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)idx + 1];
     }];
}

@end
