//
//  main.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        Person *person1 = [[Person alloc] initWithFirstName:@"Alex" lastName:@"Hong" age:25];
        
        NSLog(@"Custom constructor %@", [person1 fullName]);
        
        Person *alexHong = [Person constructPersonFromDictionary:@{
            @"firstName": @"Alex",
            @"lastName": @"Hong",
            @"age": @(30)
        }];
        
        NSLog(@"From Dict: %@", [alexHong fullName]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
