//
// Created by Anastasia on 6/22/16.
//

#import "NSObject+TCDoWith.h"

@implementation NSObject (TCDoWith)
+ (instancetype) tc_with:(void (^)(id o))block
{
	id object = [self new];
	block(object);
	return object;
}

- (instancetype) tc_with:(void (^)(id o))block
{
	block(self);
	return self;
}
@end