//
//  SharedManager.m
//  iHome
//
//  Created by Alex Hong on 5/17/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeStore.h"
@interface HomeStore () {
    NSMutableSet<NSObject *> *homeDelegates;
    NSMutableSet<NSObject *> *accessoryDelegates;
}
@property (nonatomic, retain) NSSet<NSObject *> *homeDelegates;
@property (nonatomic, retain) NSSet<NSObject *> *accessoryDelegates;

@end


@implementation HomeStore

@synthesize homeManager;
@synthesize homeDelegates;
@synthesize accessoryDelegates;

#pragma mark Singleton Methods

+ (id)shared {
    static HomeStore *shared = nil;
    static dispatch_once_t onceToken;
    
    // Thread safe singleton
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id) init {
    if (self = [super init]) {
        homeManager = [[HMHomeManager alloc] init];
        homeDelegates = [[NSMutableSet<NSObject *> alloc] init];
        accessoryDelegates = [[NSMutableSet<NSObject *> alloc] init];
    }
    return self;
}

- (void) addHomeDelegate: (NSObject *) delegate {
    [homeDelegates addObject:delegate];
    NSLog(@"addHomeDelegate: %@", delegate.description);
}

- (void) removeHomeDelegate: (NSObject *) delegate {
    [homeDelegates removeObject:delegate];
    NSLog(@"removeHomeDelegate: %@", delegate.description);
}

- (void) removeAllHomeDelegates {
    [homeDelegates removeAllObjects];
    NSLog(@"removeAllHomeDelegates");
}

- (void) addAccessoryDelegate: (NSObject *) delegate {
    [accessoryDelegates addObject:delegate];
    NSLog(@"addAccessoryDelegate: %@", delegate.description);
}

- (void) removeAccessoryDelegate: (NSObject *) delegate {
    [accessoryDelegates removeObject:delegate];
    NSLog(@"removeAccessoryDelegate: %@", delegate.description);
}

- (void) removeAllAccessoryDelegates {
    [accessoryDelegates removeAllObjects];
    NSLog(@"removeAllAccessoryDelegates");
}

@end
