//
//  RootViewController.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController.h"
#import "AccessoryViewController.h"

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
    [self printHomes];
}

-(void)accessoryClicked: (HMAccessory *)accessory{
    [self performSegueWithIdentifier:@"toAccessory" sender:accessory];
}

-(void)printHomes {
    NSLog(@"Homes List");
    for (HMHome *home in self.homes) {
        NSLog(@"Home: %@", home.name);
        for (HMAccessory *accessory in home.accessories) {
            NSLog(@"- Home Accessory: %@, room : %@", accessory.name, accessory.room.name);
            for(HMService *service in accessory.services) {
//                NSLog(@"- - Home Service: %@", service.name);
                for(HMCharacteristic *characteristic in service.characteristics) {
//                    NSLog(@"- - - Home Characteristic: %@", characteristic.localizedDescription);
                }
            }
        }
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
//    AccessoryViewController *vc = [segue destinationViewController];
    AccessoryViewController *vc = [segue destinationViewController];
    vc.accessory = sender;
    NSLog(@"prepare segue: ");
}


#pragma mark - HMHomeManagerDelegate

- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager {
    NSLog(@"Change occured at homes!");
    [self addHomes:self.homeManager.homes];
    self.homeLabel.title = self.homeManager.primaryHome.name;
    self.collectionView.reloadData;
}

#pragma mark - HMHomeDelegate
- (void)home:(HMHome *)home didAddAccessory:(HMAccessory *)accessory {
    
}

- (void)home:(HMHome *)home didRemoveAccessory:(HMAccessory *)accessory {
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.homeManager.primaryHome.accessories.count;
}

/**
 Get all accessories of primary home into cells
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *item = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    UILabel *label = [item viewWithTag:100];
    label.text = self.homeManager.primaryHome.accessories[indexPath.row].name;
    item.backgroundColor = UIColor.lightGrayColor;
    return item;
}

#pragma mark - UIColectionViewDelegate

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *cellLabel = [cell viewWithTag:100];
    
    HMAccessory *accessory = self.homeManager.primaryHome.accessories[indexPath.row];
    NSLog(@"Selected Item at %@ : %@", cellLabel.text, accessory.name);
    
    [self accessoryClicked:accessory];
}

/**
 Triggered when cell item is pressed
 */
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.darkGrayColor;
}

/**
Triggered when cell item is released
*/
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.lightGrayColor;
}

@end
