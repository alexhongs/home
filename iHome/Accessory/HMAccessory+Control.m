//
//  UIAccessory+Control.m
//  iHome
//
//  Created by Alex Hong on 5/26/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMAccessory+Control.h"

@implementation HMAccessory (Control)

- (HMCharacteristic*) find: (NSString *)serviceType : (NSString *) characteristicType {
    NSArray<HMService *> *services = self.services;
    NSLog(@"find: %@ %@", serviceType, characteristicType);

    NSArray *filterServiceType = [services filter:^BOOL(HMService* obj) {
        return [obj.serviceType isEqual:serviceType];
    }];
    
    NSMutableArray *chararcteristics = [NSMutableArray new];
    for(HMService *service in filterServiceType) {
        for(HMCharacteristic *ch in service.characteristics) {
            [chararcteristics addObject:ch];
        }
    }
    
    for (HMCharacteristic *c in chararcteristics) {
        NSLog(@"c - %@", c.localizedDescription);
        if([c.metadata.format isEqual:characteristicType]) {
            NSLog(@"Found: %@", c.metadata);
            return c;
        }
    }
    return nil;
}

@end
