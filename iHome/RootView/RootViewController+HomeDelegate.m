//
//  RootViewController+HomeDelegate.m
//  iHome
//
//  Created by Alex Hong on 5/24/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController+HomeDelegate.h"

#pragma mark - HMHomeDelegate
@implementation RootViewController (RootViewHomeDelegate)

- (void) homeDidUpdateName:(HMHome *)home {
    NSLog(@"RootVC: homeDidUpdateName");
}

- (void) home:(HMHome *)home didAddRoom:(HMRoom *)room {
    NSLog(@"RootVC: didAddRoom");
}

- (void) home:(HMHome *)home didRemoveRoom:(nonnull HMRoom *)room {
    NSLog(@"RootVC: didRemoveRoom");
}

- (void)home:(HMHome *)home didAddAccessory:(HMAccessory *)accessory {
    NSLog(@"RootVC: didAddAccessory");
}

- (void)home:(HMHome *)home didRemoveAccessory:(HMAccessory *)accessory {
    NSLog(@"RootVC: didRemoveAccessory");
}

@end
