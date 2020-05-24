//
//  RootViewController+HomeManager.m
//  iHome
//
//  Created by Alex Hong on 5/24/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//
#import "HomeStore.h"
#import "RootViewController+HomeManager.h"

@implementation RootViewController (RootViewControllerHomeManager)

#pragma mark - HMHomeManagerDelegate

- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager {
    NSLog(@"Change occured at homes!");
    HomeStore *shared = [HomeStore shared];
    self.homes = shared.homeManager.homes;
    [self updateView];
    [self printHomes];
}


@end
