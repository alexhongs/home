//
//  RootViewController.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController.h"
#import "AccessoryViewController.h"
#import "HomeSettingsViewController.h"
//#import "HomeStore.h"
#import "HomeStore+HomeDelegate.h"

@interface RootViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeStore *shared = [HomeStore shared];
    [shared addHomeDelegate:self];
    
    _homeManager = shared.homeManager;
    _homeManager.delegate = self;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

-(void)accessoryClicked: (HMAccessory *)accessory{
    [self performSegueWithIdentifier:@"toAccessory" sender:accessory];
}

- (IBAction)menuClicked:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Homes" message:@"Choose your home" preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (HMHome *home in self.homes) {
        UIAlertAction *homeAction = [UIAlertAction actionWithTitle:home.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            HomeStore *shared = [HomeStore shared];
            [shared.homeManager updatePrimaryHome:home completionHandler:^(NSError * _Nullable error) {
                [self updateView];
            }];
        }]; [alert addAction:homeAction];
    }
    
    UIAlertAction *addHomeAction = [UIAlertAction actionWithTitle:@"Add Home" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self showAddHome];
    }]; [alert addAction:addHomeAction];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Home Settings" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self showHomeSettings];
    }]; [alert addAction:settingsAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]; [alert addAction:cancelAction];

    [self presentViewController:alert animated:true completion:nil];
}

- (void)showHomeSettings {
    [self performSegueWithIdentifier:@"toSettings" sender:nil];
}

- (void)showAddHome {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add Home" message:@"Provide your name" preferredStyle:UIAlertControllerStyleAlert];
    
    // Action Items
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *homeName = alertController.textFields[0].text;
        NSString *roomName = alertController.textFields[1].text;
        
        NSLog(@"Home Name : %@, Room Name : %@", homeName, roomName);
        [self addHome:homeName :roomName];
    }]; [alertController addAction:confirmAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]; [alertController addAction:cancelAction];
    
    // Text Fields
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Enter Home name";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Enter Room name";
    }];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (void)updateView {
    self.titleLabel.text = self.homeManager.primaryHome.name;
    self.homes = self.homeManager.homes;
    [self.collectionView reloadData];
}

/**
 TODO: Need to move add home functionality to home settings controller later. Delegate will be moved to there.
 */
- (void)addHome:(NSString *) name :(NSString *) room {
    // Create new home and new room
    __weak typeof(self) weakSelf = self;
    
    [self.homeManager addHomeWithName:name completionHandler:^(HMHome * _Nullable home, NSError * _Nullable error) {
        if(error == nil) {
            [home addRoomWithName: room completionHandler:^(HMRoom * _Nullable room, NSError * _Nullable error) {
                if(error != nil) {
                    NSLog(@"Error adding Room : %@", error);
                }
            }];
            
            
            // Establish the strong self reference
            __strong typeof(self) strongSelf = weakSelf;

            if (strongSelf) {
               [strongSelf.homeManager updatePrimaryHome:home completionHandler:^(NSError * _Nullable error) {
                    [strongSelf updateView];
                }];
            } else {
                // self doesn't exist
            }
            
        } else {
            NSLog(@"Error adding Home. Check if the %@ already exists", name);
        }
    }];
}

-(void)printHomes {
    NSLog(@"Homes List");
    for (HMHome *home in self.homes) {
        NSLog(@"Home: %@", home.name);
        for (HMAccessory *accessory in home.accessories) {
            NSLog(@"- Home Accessory: %@, room : %@", accessory.name, accessory.room.name);
        }
        
        for (HMRoom *room in home.rooms) {
            NSLog(@"- Room: %@", room.name);
            for (HMAccessory *accessory in room.accessories) {
                NSLog(@"- - Home Accessory: %@, room : %@", accessory.name, accessory.room.name);
                for (HMService *service in accessory.services) {
                    NSLog(@"s : %@", service.name);
                }
            }
        }
    }
    
    NSLog(@"Rooms List");
    for (HMRoom *room in _homeManager.primaryHome.rooms) {
        NSLog(@"- Room: %@", room.name);
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare segue: ");
    
    if([segue.identifier  isEqual: @"toAccessory"]) {
        AccessoryViewController *vc = [segue destinationViewController];
        vc.accessory = sender;
    }
}

@end
