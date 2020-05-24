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

@interface RootViewController : UIViewController<HMHomeManagerDelegate, HMHomeDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

    @property (nonatomic, strong) NSArray<HMHome *> *homes;
    @property (nonatomic, strong) HMHomeManager *homeManager;

- (void) updateView;
- (void) printHomes;
@end

NS_ASSUME_NONNULL_END
