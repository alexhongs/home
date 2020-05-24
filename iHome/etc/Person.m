//
//  Person.m
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic) NSInteger age;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;

@end

@implementation Person
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    if(self = [super init]) {
        //Do initialization here
        _age = age;
        _lastName = lastName;
        _firstName = firstName;
    }
    return self;
}

- (NSString *)fullName {
    NSString *fullName = nil;
    if (self.firstName && self.lastName) {
        fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    }
    return fullName;
}

+ (Person *)constructPersonFromDictionary:(NSDictionary *)dictionary {
    Person *person = nil;
    NSNumber *age = dictionary[@"age"];
    NSString *firstName  = dictionary[@"firstName"];
    NSString *lastName  = dictionary[@"lastName"];
    
    if(age && firstName && lastName) {
        person = [[Person alloc] initWithFirstName:firstName lastName:lastName age:[age integerValue]];
    }
    
    return person;
}
@end
