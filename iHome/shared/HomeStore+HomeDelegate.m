//
//  HomeStore+HomeDelegate.m
//  iHome
//
//  Created by Alex Hong on 5/23/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//
#import "HomeStore+HomeDelegate.h"

@implementation HomeStore (HomeStoreHomeDelegate)

- (void) addHomeDelegate: (NSObject *) delegate {
    NSLog(@"HS: addHomeDelegate: %@", delegate.description);
    [self.homeDelegates addObject:delegate];
}

- (void) removeHomeDelegate: (NSObject *) delegate {
    NSLog(@"HS: removeHomeDelegate: %@", delegate.description);
    [self.homeDelegates removeObject:delegate];
}

- (void) removeAllHomeDelegates {
    NSLog(@"HS: removeAllHomeDelegates");
    [self.homeDelegates removeAllObjects];
}


//Distribute received notification to home delegates
- (void) homeDidUpdateName:(HMHome *)home {
    NSLog(@"HS: homeDidUpdateName");
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate homeDidUpdateName:home];
    }
}

- (void) home:(HMHome *)home didAddRoom:(HMRoom *)room {
    NSLog(@"HS: didAddRoom");
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didAddRoom:room];
    }
}

- (void) home:(HMHome *)home didRemoveRoom:(nonnull HMRoom *)room {
    NSLog(@"HS: didRemoveRoom");
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didRemoveRoom:room];
    }
}

- (void) home:(HMHome *)home didAddAccessory:(nonnull HMAccessory *)accessory {
    NSLog(@"HS: didAddAccessory");
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didAddAccessory:accessory];
    }
}

- (void) home:(HMHome *)home didRemoveAccessory:(nonnull HMAccessory *)accessory {
    NSLog(@"HS: didRemoveAccessory");
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didRemoveAccessory:accessory];
    }
}
@end
