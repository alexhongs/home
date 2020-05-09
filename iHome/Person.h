//
//  Person.h
//  iHome
//
//  Created by Alex Hong on 5/6/20.
//  Copyright © 2020 alexhongs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//    @public
//    NSInteger age;
    
//@property (nonatomic) NSInteger age;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age;

- (NSString *)fullName;

+ (Person *)constructPersonFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
