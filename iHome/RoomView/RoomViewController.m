//
//  RoomViewController.m
//  iHome
//
//  Created by Alex Hong on 5/19/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RoomViewController.h"

#import "HomeSettingsViewController.h"
#import "HomeStore.h"

@interface RoomViewController ()
@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"RootViewContoller - View Did Load");
    // Do any additional setup after loading the view.
    HomeStore *hs = [HomeStore shared];
    
    _homeManager = hs.homeManager;
    _home = _homeManager.primaryHome;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

//- (void)viewDidAppear:(BOOL)animated {
//    HomeStore *hs = [HomeStore shared];
//    _home = hs.homeManager.primaryHome;
//    [self updateView];
//}

- (IBAction)menuClicked:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Rooms" message:@"Choose your room" preferredStyle:UIAlertControllerStyleActionSheet];
    _home = _homeManager.primaryHome;
    
    for (HMRoom *room in _home.rooms) {
        UIAlertAction *homeAction = [UIAlertAction actionWithTitle:room.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]; [alert addAction:homeAction];
    }
    
    UIAlertAction *addHomeAction = [UIAlertAction actionWithTitle:@"Add Room" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self showAddRoom];
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

- (void)showAddRoom {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Room Home" message:@"Provide your name" preferredStyle:UIAlertControllerStyleAlert];
    
    // Action Items
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        __weak typeof(self) weakSelf = self;
        
        NSString *name = alertController.textFields[0].text;
        NSLog(@"adding room name: %@", name);
        [self.homeManager.primaryHome addRoomWithName:name completionHandler:^(HMRoom * _Nullable room, NSError * _Nullable error) {
            if(error) {
                NSLog(@"Error: %@", error);
            } else{
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf updateView];
            }
        }];
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
@end

