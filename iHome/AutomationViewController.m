//
//  AutomationViewController.m
//  iHome
//
//  Created by Alex Hong on 5/20/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "AutomationViewController.h"
#import "HomeStore.h"

@interface AutomationViewController ()
@property (strong, nonatomic) SharedManager *sharedManager;
@property (strong, nonatomic) HMHome *home;
@property (strong, nonatomic) HMActionSet *actionSet;
@end

@implementation AutomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _sharedManager = [SharedManager shared];
    _home = _sharedManager.homeManager.primaryHome;
}

- (void) printActionSets {
    NSLog(@"%@ Action Sets: ", _home.name);
    for (HMActionSet *actionSet in _home.actionSets) {
        NSLog(@"- ActionSet: %@", actionSet.name);
        for (HMAction *action in actionSet.actions) {
            NSLog(@"- - Action: %@", action.debugDescription);
        }
    }
}

- (void) printTriggeredActionSets {
    NSLog(@"%@ Triggers: ", _home.name);
    for (HMTrigger *trigger in _home.triggers) {
        NSLog(@"- Trigger: %@  %@", trigger.name, trigger.description);
        
        for (HMAction *action in trigger.actionSets) {
            NSLog(@"- - Action: %@", action.debugDescription);
        }
    }
}

- (IBAction)seeActions:(UIButton *)sender {
    [self printActionSets];
    [self printTriggeredActionSets];
}


- (IBAction)addAction:(UIButton *)sender {
    
    [_home addActionSetWithName:@"actionSet1" completionHandler:^(HMActionSet * _Nullable actionSet, NSError * _Nullable error) {
        HMAction *action = [[HMAction alloc] init];
//        [HMActionSetTypeWakeUp i]
        
        [actionSet addAction:HMActionSetTypeWakeUp completionHandler:^(NSError * _Nullable error) {
            
        }];
        self.actionSet = actionSet;
        
    }];
    
    NSLog(@"Added Action Set  %@ : %@", _actionSet.name, _actionSet.description);
    
}

- (IBAction)removeAction:(id)sender {
    [_home removeActionSet:_actionSet completionHandler:^(NSError * _Nullable error) {
        NSLog(@"Removed Action Set %@", error);
    }];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void) printTrigger: (HMEventTrigger *) trigger {
    if([trigger isKindOfClass:HMEventTrigger.class]) {
        NSLog(@"- - is HMEventTrigger");
        HMEventTrigger *eventTrigger = (HMEventTrigger *) trigger;
        for(HMEvent *event in eventTrigger.events) {
            if([event isKindOfClass:HMCharacteristicEvent.class]) {
                HMCharacteristicEvent * cevent = (HMCharacteristicEvent *) event;
                NSLog(@"- - - %@ chrt: %@ trg value:%@", event.description,
                      cevent.characteristic.characteristicType,cevent.triggerValue);
            }
            else if([event isKindOfClass:HMLocationEvent.class]) {
                 HMLocationEvent * cevent = (HMLocationEvent *) event;
                NSLog(@"- - - %@ chrt: %@", event.description, cevent.region);
            }
            else if([event isKindOfClass:HMCalendarEvent.class]) {
                 HMCalendarEvent * cevent = (HMCalendarEvent *) event;
                NSLog(@"- - - %@ chrt: %@", event.description, cevent.fireDateComponents);
            }
            else if([event isKindOfClass:HMSignificantTimeEvent.class]) {
                HMSignificantTimeEvent * cevent = (HMSignificantTimeEvent *) event;
                NSLog(@"- - - %@ chrt: %@ trg value:%@",event.description, cevent.offset.description, cevent.significantEvent.capitalizedString);
            }
        }
    }
}

@end
