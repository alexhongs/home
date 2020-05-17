//
//  HomeSettingsViewController.h
//  iHome
//
//  Created by Alex Hong on 5/16/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) HMHomeManager *homeManager;

@end

NS_ASSUME_NONNULL_END
