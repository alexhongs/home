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

@interface SharedManager : NSObject {
    HMHomeManager *homeManager;
}

@property (nonatomic, retain) HMHomeManager *homeManager;

+ (id)sharedManager;

@end

NS_ASSUME_NONNULL_END
