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

@interface HomeStore : NSObject {
    HMHomeManager *homeManager;
}

@property (nonatomic, retain) HMHomeManager *homeManager;
// Singleton
+ (id)shared;

// Home Delegate Methods
- (void) addHomeDelegate: (NSObject *) delegate;
- (void) removeHomeDelegate: (NSObject *) delegate;
- (void) removeAllHomeDelegates;

- (void) addAccessoryDelegate: (NSObject *) delegate;
- (void) removeAccessoryDelegate: (NSObject *) delegate;
- (void) removeAllAccessoryDelegates;
@end

NS_ASSUME_NONNULL_END
