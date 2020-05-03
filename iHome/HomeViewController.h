//
//  ViewController.h
//  iHome
//
//  Created by Alex Hong on 5/2/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>
@interface HomeViewController : UICollectionViewController
    @property (strong, atomic) HMHomeManager *homeManager;

@end

