//
//  AccessoryViewController.h
//  iHome
//
//  Created by Alex Hong on 5/16/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AccessoryViewController : UIViewController
@property (nonatomic, strong) HMAccessory *accessory;
@end

NS_ASSUME_NONNULL_END
