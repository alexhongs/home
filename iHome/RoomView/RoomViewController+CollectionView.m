//
//  RoomViewController+CollectionView.m
//  iHome
//
//  Created by Alex Hong on 5/24/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//
#import "HomeStore.h"
#import "RoomViewController+CollectionView.h"

@implementation RoomViewController(RoomViewControllerCollectionView)

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    HomeStore *hs = [HomeStore shared];
    NSLog(@"%@,", hs.homeManager.primaryHome.name);
    NSLog(@"%lu,", (unsigned long)hs.homeManager.primaryHome.rooms.count);
    return hs.homeManager.primaryHome.rooms[0].accessories.count;
}

/**
 Get all accessories of primary home into cells
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeStore *hs = [HomeStore shared];
    NSLog(@"%@,", hs.homeManager.primaryHome.name);
    NSLog(@"%lu,", (unsigned long)hs.homeManager.primaryHome.rooms.count);
    UICollectionViewCell *item = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    UILabel *label = [item viewWithTag:100];
    label.text = self.homeManager.primaryHome.rooms[0].accessories[indexPath.row].name;
    item.backgroundColor = UIColor.whiteColor;
    return item;
}

#pragma mark - UICollectionViewDelegate

/**
 Triggered when cell item is clicked
 */
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *cellLabel = [cell viewWithTag:100];
    
    HMAccessory *accessory = self.homeManager.primaryHome.rooms[0].accessories[indexPath.row];
    NSLog(@"Selected Item at %@ : %@", cellLabel.text, accessory.name);
}

/**
 Triggered when cell item is pressed
 */
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.lightGrayColor;
}

/**
Triggered when cell item is released
*/
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = UIColor.whiteColor;
}


@end
