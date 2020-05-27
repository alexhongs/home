//
//  AccessoryViewController.m
//  iHome
//
//  Created by Alex Hong on 5/16/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "AccessoryViewController.h"

@interface AccessoryViewController ()
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation AccessoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Accessory: appeared");
    self.navigationBar.title = self.accessory.name;
    self.titleLabel.text = [[NSString alloc] initWithFormat:@"This is %@",self.accessory.name];
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
