//
//  SharedManager.m
//  iHome
//
//  Created by Alex Hong on 5/17/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeStore.h"

@implementation SharedManager

@synthesize homeManager;

#pragma mark Singleton Methods

+ (id)shared {
    static SharedManager *shared = nil;
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
        homeDelegates = [[NSSet<NSObject *> alloc] init];
        accessoryDelegates = [[NSSet<NSObject *> alloc] init];
    }
    return self;
}

@end
