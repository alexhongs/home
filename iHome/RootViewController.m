//
//  RootViewController.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"RootViewContoller - View Did Load");
    // Do any additional setup after loading the view.
    
//    NSLog(@"RootViewController - UILabel: %s", self.label.attributedText);
//    self.home = [HMHome c];
    self.homeManager = [[HMHomeManager alloc] init];
    [self addHomes:self.homeManager.homes];
    self.homeManager.delegate = self;
}

- (IBAction)addHome:(UIButton *)sender {
    NSLog(@"Add Home Clicked %@", sender.currentTitle);
//    [self performSegueWithIdentifier:@"toAccessory" sender:sender];
    [self.homeManager addHomeWithName:@"alexHong" completionHandler:^(HMHome * _Nullable home, NSError * _Nullable error) {
        if(error == nil) {
            
        } else {
            NSLog(@"Error adding Home");
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

#pragma mark - HMHomeMangerDelegate

- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager {
    NSLog(@"Change occured at homes!");
    [self addHomes:self.homeManager.homes];
}

#pragma mark - HMHomeDelegate
- (void)home:(HMHome *)home didAddAccessory:(HMAccessory *)accessory {
    
}

- (void)home:(HMHome *)home didRemoveAccessory:(HMAccessory *)accessory {
    
}


@end
