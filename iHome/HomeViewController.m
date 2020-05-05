//
//  ViewController.m
//  iHome
//
//  Created by Alex Hong on 5/2/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeManager = [[HMHomeManager alloc] init];
    self.homeManager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}

- (IBAction)addHome:(UIBarButtonItem *)sender {
    [self.homeManager addHomeWithName:@"Honger Home" completionHandler: nil];
    
    NSLog(@"Home Added?");
}


@end
