//
//  NSArray+Utility.h
//
//  Source
//  https://medium.com/@weijentu/higher-order-functions-in-objective-c-850f6c90de30
//

#import <Foundation/Foundation.h>

@interface NSArray (Utility)
- (NSArray *)map:(id (^)(id obj))block;

- (NSArray *)filter:(BOOL (^)(id obj))block;

- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;

- (NSArray *)flatMap:(id (^)(id obj))block;
@end
