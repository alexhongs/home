//
//  HomeStore+HomeDelegate.h
//  iHome
//
//  Created by Alex Hong on 5/23/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeStore.h"

@interface HomeStore (HomeStoreHomeDelegate)
- (void) addHomeDelegate: (NSObject *) delegate;
- (void) removeHomeDelegate: (NSObject *) delegate;
- (void) removeAllHomeDelegates;
@end
