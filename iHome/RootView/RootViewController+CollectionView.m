//
//  HomeStore+CollectionView.m
//  iHome
//
//  Created by Alex Hong on 5/24/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController+CollectionView.h"

@implementation RootViewController (RootViewControllerCollectionView)

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
    item.backgroundColor = UIColor.whiteColor;
    return item;
}

#pragma mark - UICollectionViewDelegate

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *cellLabel = [cell viewWithTag:100];
    
    HMAccessory *accessory = self.homeManager.primaryHome.accessories[indexPath.row];
    NSLog(@"Selected Item at %@ : %@", cellLabel.text, accessory.name);
    //TODO: Make this clickable to toggle actions. (need Developer License)
}

/**
 Triggered when cell item is pressed
 */
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.lightGrayColor;
    HMAccessory *accessory = self.homeManager.primaryHome.accessories[indexPath.row];
    // TODO: Figure out activate accessoryVC with some delay. click for 2 sec events
    //    [self accessoryClicked: accessory];
//    for (HMCharacteristic *ch in accessory.services.lastObject.characteristics){
//        NSLog(@"c %@", ch.localizedDescription);
//    }
//
}

/**
Triggered when cell item is released
*/
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.whiteColor;
}

@end
