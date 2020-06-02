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
@property (strong, nonatomic) HomeStore *sharedManager;
@property (strong, nonatomic) HMHome *home;
@property (strong, nonatomic) HMActionSet *actionSet;
@end

@implementation AutomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _sharedManager = [HomeStore shared];
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
    [self findActionSetWithName:@"actionSet3"];
    [self printActionSets];
    [self printTriggeredActionSets];
}


- (IBAction)addAction:(UIButton *)sender {
    
    [_sharedManager.homeManager.primaryHome addActionSetWithName:@"actionSet3" completionHandler:^(HMActionSet * _Nullable actionSet, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Add ActionSet %@", error);
            return;
        }
        HMAction *action = [[HMAction alloc] init];
        //        [HMActionSetTypeWakeUp i]
        [actionSet addAction:HMActionSetTypeWakeUp completionHandler:^(NSError * _Nullable error) {
            if(error) {
                NSLog(@"Add Action %@", error);
                return;
            }
        }];
        self.actionSet = actionSet;
        NSLog(@"Added Action Set  %@ : %@", _actionSet.name, _actionSet.description);
    }];
}

- (IBAction)removeAction:(id)sender {
    HMActionSet* actionSet = [self findActionSetWithName:@"actionSet2"];
    [_home removeActionSet:actionSet completionHandler:^(NSError * _Nullable error) {
        if(error) {
            NSLog(@"Remove Action Set %@", error);
            return;
        }
        NSLog(@"Removed Action Set");
    }];
}

- (HMActionSet *) findActionSetWithName:(NSString*) name {
    for (HMActionSet *actionSet in _home.actionSets)
    {
        NSLog(@"Finding ActionSet: |%@|, finding: |%@|", actionSet.name, name);
        if([actionSet.name isEqualToString:name]) {
            NSLog(@"Found! %@", actionSet.name);
            return actionSet;
        }
    }
    return nil;
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
