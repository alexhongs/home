//
//  AccessoryCell.m
//  iHome
//
//  Created by Alex Hong on 5/28/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "AccessoryCell.h"

@interface AccessoryCell ()
    
    @property (nonatomic, strong) IBOutlet UILabel *title;

@end

@implementation AccessoryCell

- (id) init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.redColor;
        self.title.backgroundColor = UIColor.redColor;
    }
    return self;
}

- (void) tap {
    
}

- (void) setAccessory: (HMAccessory*)accessory {
    _accessory = accessory;
    self.title.text = _accessory.name;
    [self reloadView];
}

- (void) reloadView {
    self.backgroundColor = UIColor.whiteColor;
}

@end
