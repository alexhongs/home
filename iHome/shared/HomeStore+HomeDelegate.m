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
    [self.homeDelegates addObject:delegate];
    NSLog(@"addHomeDelegate: %@", delegate.description);
}

- (void) removeHomeDelegate: (NSObject *) delegate {
    [self.homeDelegates removeObject:delegate];
    NSLog(@"removeHomeDelegate: %@", delegate.description);
}

- (void) removeAllHomeDelegates {
    [self.homeDelegates removeAllObjects];
    NSLog(@"removeAllHomeDelegates");
}


//Distribute received notification to home delegates
- (void) homeDidUpdateName:(HMHome *)home {
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate homeDidUpdateName:home];
    }
}

- (void) home:(HMHome *)home didAddRoom:(HMRoom *)room {
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didAddRoom:room];
    }
}

- (void) home:(HMHome *)home didRemoveRoom:(nonnull HMRoom *)room {
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didRemoveRoom:room];
    }
}

- (void) home:(HMHome *)home didAddAccessory:(nonnull HMAccessory *)accessory {
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didAddAccessory:accessory];
    }
}

- (void) home:(HMHome *)home didRemoveAccessory:(nonnull HMAccessory *)accessory {
    for (NSObject<HMHomeDelegate>* delegate in self.homeDelegates) {
        [delegate home:home didRemoveAccessory:accessory];
    }
}
@end
