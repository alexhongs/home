//
//  AccessoryCell.m
//  iHome
//
//  Created by Alex Hong on 5/28/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "AccessoryCell.h"
#import "HMAccessory+Control.h"

@interface AccessoryCell ()
    @property (nonatomic, strong) IBOutlet UILabel *title;
    @property (nonatomic, strong) NSArray* TYPE;
@end

@implementation AccessoryCell

- (id) init {
    self = [super init];
    // TODO: init is not getting called. why is this?
//    if (self) {
//        self.backgroundColor = UIColor.redColor;
//        self.title.backgroundColor = UIColor.redColor;
//        self.TYPE = [[NSArray alloc] initWithObjects:HMServiceTypeLightbulb, HMServiceTypeOutlet, nil];
//    }
    return self;
}

- (void) tap {
    HMCharacteristic *power = [self getPowerState];

    BOOL toggleState = FALSE;
    NSString *powerValue = [[NSString alloc] initWithFormat:@"%@", power.value];
    if([powerValue isEqualToString:@"0"]) {
        toggleState = TRUE;
    }

    NSNumber *toggle = [[NSNumber alloc] initWithBool:toggleState];

    NSLog(@"Power: %@ %@ %@ new: %@", power.characteristicType, power.value, toggleState ? @"YES": @"NO", toggle);
    
    [power writeValue:toggle completionHandler:^(NSError * _Nullable error) {
        if(error) {
            NSLog(@"Power Toggle Error: %@", error.description);
        }
        //TODO: reload view: this will be used for on/off color state on view
        [(UICollectionView*) self.superview reloadData];
    }];
}

- (void) setAccessory: (HMAccessory*)accessory {
    _accessory = accessory;
    self.title.text = _accessory.name;
    [self reloadView];
}

- (void) reloadView {
    self.backgroundColor = UIColor.whiteColor;
}

- (HMCharacteristic*) getPowerState {
    HMCharacteristic *power;
    if(self.TYPE.count == 0) {
        self.TYPE = [[NSArray alloc] initWithObjects:HMServiceTypeLightbulb, HMServiceTypeOutlet, nil];
    }

    for(NSString* serviceType in self.TYPE) {
        power = [self.accessory find:serviceType :HMCharacteristicMetadataFormatBool];
        if(power != nil) {
            return power;
        }
    }
    return nil;
}

@end
