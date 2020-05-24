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

@end
