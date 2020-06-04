//
//  main.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
