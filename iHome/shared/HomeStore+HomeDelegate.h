//
//  HomeStore+HomeDelegate.h
//  iHome
//
//  Created by Alex Hong on 5/23/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeStore.h"

@interface HomeStore (HomeStoreHomeDelegate)
- (void) addHomeDelegate: (NSObject *) delegate;
- (void) removeHomeDelegate: (NSObject *) delegate;
- (void) removeAllHomeDelegates;

- (void) homeDidUpdateName:(HMHome *)home;

- (void) home:(HMHome *)home didAddRoom:(HMRoom *)room;
- (void) home:(HMHome *)home didRemoveRoom:(nonnull HMRoom *)room;

- (void) home:(HMHome *)home didAddAccessory:(nonnull HMAccessory *)accessory;
- (void) home:(HMHome *)home didRemoveAccessory:(nonnull HMAccessory *)accessory;

@end
