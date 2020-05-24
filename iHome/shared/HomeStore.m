//
//  SharedManager.m
//  iHome
//
//  Created by Alex Hong on 5/17/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeStore.h"
@interface HomeStore () {
}
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
@end
