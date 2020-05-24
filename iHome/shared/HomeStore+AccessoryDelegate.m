//
//  HomeStore+AccessoryDelegate.m
//  iHome
//
//  Created by Alex Hong on 5/23/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeStore+AccessoryDelegate.h"

@implementation HomeStore (HomeStoreAccessoryDelegate)

- (void) addAccessoryDelegate: (NSObject *) delegate {
    [self.accessoryDelegates addObject:delegate];
    NSLog(@"addAccessoryDelegate: %@", delegate.description);
}

- (void) removeAccessoryDelegate: (NSObject *) delegate {
    [self.accessoryDelegates removeObject:delegate];
    NSLog(@"removeAccessoryDelegate: %@", delegate.description);
}

- (void) removeAllAccessoryDelegates {
    [self.accessoryDelegates removeAllObjects];
    NSLog(@"removeAllAccessoryDelegates");
}


@end
