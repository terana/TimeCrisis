//
// Created by Anastasia on 7/12/16.
//

#import "TCServerManager.h"
#import "TCServer.h"

@implementation TCServerManager
{
	TCServer *_server;
}
+ (instancetype) shared
{
	static TCServerManager *staticInstance = nil;
	static dispatch_once_t once;
	dispatch_once(&once, ^{
		staticInstance = [self new];
	});
	return staticInstance;
}

- (void) getInformationForUser:(TCUser *)user callback:(void (^)(TCUser *, NSError *))callback
{
	[_server doGet:@"/user" withParameters:@{@"access_token": [[NSUserDefaults standardUserDefaults] stringForKey:@"access_token"]} callback:[self callbackParsingClass:[TCUser class] andSendingTo:callback]];
}
-(void(^)(id, NSError *)) callbackParsingClass:(Class)cl andSendingTo:(void(^)(id, NSError *))callback
{
return ^(id result, NSError *error) {
	if (error)
	{
		callback(nil, error);
	}
	callback([self parse:result as:cl], nil);
};
}

-(id)parse:(id)primitives as:(Class)cl
{
	return [TCUser unmap:primitives];
};
@end