//
//  SharedManager.m
//  iHome
//
//  Created by Alex Hong on 5/17/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "SharedManager.h"

@implementation SharedManager

@synthesize homeManager;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static SharedManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    // Thread safe singleton
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id) init {
    if (self = [super init]) {
        homeManager = [[HMHomeManager alloc] init];
        
    }
    
    return self;
}

@end
