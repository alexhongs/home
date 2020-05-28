//
//  AccessoryCell.h
//  iHome
//
//  Created by Alex Hong on 5/28/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>

@interface AccessoryCell : UICollectionViewCell
    @property (nonatomic, strong) HMAccessory* accessory;

- (void) tap;
- (HMService*) service;
- (void) setAccessory: (HMAccessory*)accessory;
@end
