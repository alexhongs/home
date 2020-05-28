//
//  UIAccessory+Control.h
//  iHome
//
//  Created by Alex Hong on 5/26/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HomeKit/HomeKit.h>
#import "NSArray+Utility.h"

@interface HMAccessory (Control)

- (HMCharacteristic*) find: (NSString *)serviceType : (NSString *) characteristicType;

@end
