//
//  RootViewController+HomeManager.m
//  iHome
//
//  Created by Alex Hong on 5/24/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//
#import "HomeStore.h"
#import "RootViewController+HomeManagerDelegate.h"

@implementation RootViewController (RootViewControllerHomeManager)

#pragma mark - HMHomeManagerDelegate

- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager {
    NSLog(@"RootVC: homeManagerDidUpdateHomes (%lu)", manager.homes.count);
    HomeStore *shared = [HomeStore shared];
    self.homes = shared.homeManager.homes;
//    [self updateView];
//    [self printHomes];
}


@end
