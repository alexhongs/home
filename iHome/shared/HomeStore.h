//
//  SharedManager.h
//  iHome
//
//  Created by Alex Hong on 5/17/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HomeKit/HomeKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeStore : NSObject<HMHomeDelegate> {
    HMHomeManager *homeManager;
    NSMutableSet<NSObject *> *homeDelegates;
    NSMutableSet<NSObject *> *accessoryDelegates;
}

@property (nonatomic, retain) HMHomeManager *homeManager;
@property (nonatomic, retain) NSMutableSet<NSObject *> *homeDelegates;
@property (nonatomic, retain) NSMutableSet<NSObject *> *accessoryDelegates;

// Singleton
+ (id)shared;

@end

NS_ASSUME_NONNULL_END
