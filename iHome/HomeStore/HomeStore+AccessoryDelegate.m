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
    NSLog(@"HS: addAccessoryDelegate: %@", delegate.description);
    [self.accessoryDelegates addObject:delegate];
}

- (void) removeAccessoryDelegate: (NSObject *) delegate {
    NSLog(@"HS: removeAccessoryDelegate: %@", delegate.description);
    [self.accessoryDelegates removeObject:delegate];
}

- (void) removeAllAccessoryDelegates {
    NSLog(@"HS: removeAllAccessoryDelegates");
    [self.accessoryDelegates removeAllObjects];
}


@end
