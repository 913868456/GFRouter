//
//  TabBarVC.m
//  GFRouterDemo
//
//  Created by ECHINACOOP1 on 2017/11/27.
//  Copyright © 2017年 蔺国防. All rights reserved.
//

#import "TabBarVC.h"
#import "FirstVC.h"
#import "SecondVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstVC *first = [[FirstVC alloc] init];
    SecondVC *second = [[SecondVC alloc] init];
    
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:first];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:second];
    
    self.viewControllers = @[nc1, nc2];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
