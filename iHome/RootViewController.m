//
//  RootViewController.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) IBOutlet UINavigationItem *homeLabel;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"RootViewContoller - View Did Load");
    // Do any additional setup after loading the view.
    self.homeManager = [[HMHomeManager alloc] init];
    self.homeManager.delegate = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (IBAction) buttonClicked:(id)sender {
    NSLog(@"Button Clicked");
}

- (void)addHome:(NSString *) name {
    [self.homeManager addHomeWithName:name completionHandler:^(HMHome * _Nullable home, NSError * _Nullable error) {
        if(error == nil) {
            
        } else {
            NSLog(@"Error adding Home. Check if the %@ already exists", name);
        }
    }];
}

- (void)addHomes:(NSArray<HMHome *>*) homes {
    self.homes = homes;
    NSLog(@"Homes List");
    for (HMHome *home in self.homes) {
        NSLog(@"Home: %@", home.name);
        for (HMAccessory *accessory in home.accessories) {
            NSLog(@"Home Accessory: %@", accessory.name);
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - HMHomeManagerDelegate

- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager {
    NSLog(@"Change occured at homes!");
    [self addHomes:self.homeManager.homes];
    self.homeLabel.title = self.homeManager.primaryHome.name;
}

#pragma mark - HMHomeDelegate
- (void)home:(HMHome *)home didAddAccessory:(HMAccessory *)accessory {
    
}

- (void)home:(HMHome *)home didRemoveAccessory:(HMAccessory *)accessory {
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1 ;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *item = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    item.backgroundColor = UIColor.blueColor;
    return item;
}

#pragma mark - UIColectionViewDelegate

@end
