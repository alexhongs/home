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
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    
    
//    cell.textLabel.text = @"some cell";
    
//    NSLog(tableView.)
    
    
    return [[UITableViewCell alloc] init];
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.vc = segue.destinationViewController;
    NSLog(@"Prepare for segue: %@", segue.destinationViewController.description);
//    self.vc.tableView.dataSource = self;
//    [self.vc.tableView reloadData];
}

@end
