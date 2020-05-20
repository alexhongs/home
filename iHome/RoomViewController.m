//
//  RoomViewController.m
//  iHome
//
//  Created by Alex Hong on 5/19/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RoomViewController.h"

#import "HomeSettingsViewController.h"
#import "SharedManager.h"

@interface RoomViewController ()
@property (strong, nonatomic) SharedManager *sharedManager;

@property (nonatomic, strong) HMHomeManager *homeManager;
@property (nonatomic, strong) HMHome *home;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"RootViewContoller - View Did Load");
    // Do any additional setup after loading the view.
    _sharedManager = [SharedManager sharedManager];
    
    _homeManager = _sharedManager.homeManager;
    _home = _homeManager.primaryHome;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated {
    _home = _homeManager.primaryHome;
    [self updateView];
}

- (IBAction)menuClicked:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Rooms" message:@"Choose your room" preferredStyle:UIAlertControllerStyleActionSheet];
    _home = _homeManager.primaryHome;
    
    for (HMRoom *room in _home.rooms) {
        UIAlertAction *homeAction = [UIAlertAction actionWithTitle:room.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]; [alert addAction:homeAction];
    }
    
    UIAlertAction *addHomeAction = [UIAlertAction actionWithTitle:@"Add Room" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self showAddHome];
    }]; [alert addAction:addHomeAction];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Room Settings" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self showSettings];
    }]; [alert addAction:settingsAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]; [alert addAction:cancelAction];

    [self presentViewController:alert animated:true completion:nil];
}

- (void)showSettings {
    [self performSegueWithIdentifier:@"toSettings" sender:nil];
}

- (void)showAddHome {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Room Home" message:@"Provide your name" preferredStyle:UIAlertControllerStyleAlert];
    
    // Action Items
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = alertController.textFields[0].text;
        
        NSLog(@"Room Name : %@", name);
    }]; [alertController addAction:confirmAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]; [alertController addAction:cancelAction];
    
    // Text Field
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Enter Room name";
    }];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (void)updateView {
    self.titleLabel.text = self.homeManager.primaryHome.rooms[0].name;
    [self.collectionView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare segue: ");
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.homeManager.primaryHome.rooms[0].accessories.count;
}

/**
 Get all accessories of primary home into cells
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

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

