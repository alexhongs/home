//
//  RootViewController.h
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController<HMHomeManagerDelegate, HMHomeDelegate>

@property (nonatomic, strong) HMHomeManager *homeManager;
@property (nonatomic, strong) HMHome *home;
@property (nonatomic, strong) NSArray<HMHome *> *homes;

- (IBAction) addHome:(id)sender;
@end

NS_ASSUME_NONNULL_END
