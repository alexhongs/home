//
//  RoomViewController.h
//  iHome
//
//  Created by Alex Hong on 5/19/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HomeKit/HomeKit.h>

@interface RoomViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) HMHomeManager *homeManager;
@property (nonatomic, strong) HMHome *home;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
