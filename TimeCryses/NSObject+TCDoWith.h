//
// Created by Anastasia on 6/22/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (TCDoWith)
+ (instancetype) tc_with:(void (^)(id o))block;
- (instancetype) tc_with:(void (^)(id o))block;
@end