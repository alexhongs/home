//
//  HomeSettingsViewController.m
//  iHome
//
//  Created by Alex Hong on 5/16/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeSettingsViewController.h"

@interface HomeSettingsViewController ()
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITableViewController *vc;
@end

@implementation HomeSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.storyboard ];
//

//    self.vc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeSettingsTableVC"];
//
//    [self addChildViewController:self.vc];
//
//    self.vc.view.translatesAutoresizingMaskIntoConstraints = true;
//    self.vc.view.frame = self.containerView.frame;
//    [self.containerView addSubview:self.vc.view];
//    [self.vc didMoveToParentViewController:self];
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
    NSLog(@"Debug Description: %@", tableView.debugDescription);
    NSLog(@"ID: %@", tableView.restorationIdentifier);
    if(self.vc != nil) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"cell in here";
        return cell;
    }
        
//    cell.textLabel.text = @"some cell";
    
//    NSLog(tableView.)
    
    
    return [[UITableViewCell alloc] init];
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.vc = segue.destinationViewController;
    NSLog(@"Prepare for segue: %@", segue.destinationViewController.description);
    self.vc.tableView.dataSource = self;
    self.vc.tableView.delegate = self;
    

    [self.vc.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
    
    [self.vc.tableView reloadData];
}

@end
