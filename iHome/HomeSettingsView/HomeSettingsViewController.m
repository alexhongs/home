//
//  HomeSettingsViewController.m
//  iHome
//
//  Created by Alex Hong on 5/16/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "HomeSettingsViewController.h"
#import "HomeStore.h"

@interface HomeSettingsViewController ()
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITableViewController *vc;
@property (strong, nonatomic) HomeStore *shared;
@end

@implementation HomeSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _shared = [HomeStore shared];
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"num rows: %lu", (unsigned long)_shared.homeManager.homes.count);
    return _shared.homeManager.homes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.vc != nil) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        
        cell.textLabel.text = _shared.homeManager.homes[indexPath.row].name;
//        cell.textLabel.text = _homeManager.homes[indexPath.row].name;
//        NSLog(@"hi%@%",_homeManager.homes[indexPath.row].name);
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}


#pragma mark - Navigation

/**
 Embedded Table View Controller on ViewDidLoad
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.vc = segue.destinationViewController;
    NSLog(@"Prepare for segue: %@", segue.destinationViewController.description);
    self.vc.tableView.dataSource = self;
    self.vc.tableView.delegate = self;

    [self.vc.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
    
//    [self.vc.tableView registerClass:UITableView.self forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>]
    
//    [self.vc.tableView reloadSectionIndexTitles];
    [self.vc.tableView reloadData];
}

@end
