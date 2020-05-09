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
}

- (IBAction)addHome:(UIButton *)sender {
    NSLog(@"Add Home Clicked %@", sender.currentTitle);
    [self performSegueWithIdentifier:@"toAccessory" sender:sender];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
