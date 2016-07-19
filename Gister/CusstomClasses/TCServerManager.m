//
// Created by Anastasia on 7/12/16.
//

#import "TCServerManager.h"
#import "TCServer.h"
#import "TCImageView.h"
#import "TCGist.h"

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

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		_server = [[TCServer alloc] initWithServerURL:@"https://api.github.com"];
	}
	return self;
}

- (void) getInformationForUserWithCallback:(void (^)(TCUser *, NSError *))callback
{
	[_server doGet:@"/user" withParameters:@{ @"access_token" : [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"] } callback:[self callbackParsingClass:[TCUser class] andSendingTo:callback]];
}

- (void (^)(id, NSError *)) callbackParsingClass:(Class)cl andSendingTo:(void (^)(id, NSError *))callback
{
	return ^(id result, NSError *error) {
		if (error)
		{
			callback(nil, error);
		}
		callback([self parse:result as:cl], nil);
	};
}

- (id) parse:(id)primitives as:(Class)cl
{
	return [cl unmap:primitives];
};

- (void) getImageWithURL:(NSString *)imageURL callback:(void (^)(UIImage *, NSError *))callback
{
	[_server doGetWithURL:imageURL callback:[self callbackCreatingImageAndSendingTo:callback]];
}

- (void (^)(id, NSError *)) callbackCreatingImageAndSendingTo:(void (^)(UIImage *, NSError *))callback
{
	return ^(NSData *data, NSError *error) {
		if (error)
		{
			callback(nil, error);
		}
		callback([UIImage imageWithData:data], error);
	};
}


- (void) getGistsForUser:(TCUser *)user callback:(void (^)(NSArray *, NSError *))callback
{
	[_server doGet:[NSString stringWithFormat:@"/users/%@/gists", user.login] withParameters:nil callback:[self callbackParsingCollectionOfClass:[TCGist class] andSendingTo:callback]];
}

-(void(^)(id, NSError *)) callbackParsingCollectionOfClass:(Class)cl andSendingTo:(void (^)(id, NSError *))callback
{
	return ^(id result, NSError *error) {
		if (error)
		{
			callback(nil, error);
		}
		NSMutableArray *array = [NSMutableArray new];
		for(__strong id object in result)
		{
			[array addObject:[self parse:object as:cl]];
		}
		callback(array, error);
	};
}

- (void) getPublicGistsWithCallback:(void (^)(NSArray *, NSError *))callback
{
}

@end