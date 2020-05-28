//
//  HomeStore+AccessoryDelegate.h
//  iHome
//
//  Created by Alex Hong on 5/23/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeStore.h"

@interface HomeStore (HomeStoreAccessoryDelegate)

- (void) addAccessoryDelegate: (NSObject *) delegate;
- (void) removeAccessoryDelegate: (NSObject *) delegate;
- (void) removeAllAccessoryDelegates;

@end
