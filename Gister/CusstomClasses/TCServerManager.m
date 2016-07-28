//
// Created by Anastasia on 7/12/16.
//

#import "TCServerManager.h"
#import "TCServer.h"
#import "NSDictionary+DictionaryWithoutNSNull.h"

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

- (void) getInformationForMainUserWithCallback:(void (^)(TCUser *, NSError *))callback
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
	if([primitives isKindOfClass:[NSDictionary class]])
	{
		primitives = [primitives dictionaryWithoutNSNull];
	}
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

- (void (^)(id, NSError *)) callbackParsingCollectionOfClass:(Class)cl andSendingTo:(void (^)(id, NSError *))callback
{
	return ^(id result, NSError *error) {
		if (error)
		{
			callback(nil, error);
		}
		NSMutableArray   *array = [NSMutableArray new];
		for (__strong id object in result)
		{
			[array addObject:[self parse:object as:cl]];
		}
		callback(array, error);
	};
}

- (void) getPublicGistsWithCallback:(void (^)(NSArray *, NSError *))callback
{
	[_server doGet:@"/gists/public" withParameters:@{ } callback:[self callbackParsingCollectionOfClass:[TCGist class] andSendingTo:callback]];
}

- (void) createGist:(TCGist *)gist callback:(void (^)(TCGist *, NSError *))callback
{
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	dictionary[@"description"] = gist.gistDescription;
	dictionary[@"public"]      = @(gist.public);
	NSMutableDictionary *files = [NSMutableDictionary new];
	for (TCFile         *file in gist.files)
	{
		files[file.filename] = @{ @"content" : file.content };
	}
	dictionary[@"files"]       = files;
	[_server doPost:@"/gists" withParameters:nil body:dictionary callback:[self callbackParsingClass:[TCGist class] andSendingTo:callback]];
}

- (void) editGist:(TCGist *)gist withCallback:(void (^)(TCGist *, NSError *))callback
{
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	dictionary[@"description"] = gist.gistDescription;
	NSMutableDictionary *files = [NSMutableDictionary new];
	for (TCFile         *file in gist.files)
	{
		if (file.changed)
		{
			if (file.content)
			{
				files[file.filename] = file.changedName ? @{ @"content" : file.content, @"filename" : file.changedName } : @{ @"content" : file.content };
			}
			else
			{
				files[file.filename] = @{ };
			}
			file.changed = NO;
		}
	}
	dictionary[@"files"] = files;
	NSString *path = [NSString stringWithFormat:@"/gists/%@", gist.id];

	[_server doPatch:path withParameters:nil body:dictionary callback:[self callbackParsingClass:[TCGist class] andSendingTo:callback]];
}

- (void) getFileContentForFile:(TCFile *)file withCallback:(void (^)(NSString *, NSError *))callback
{
	[_server doGetWithURL:file.rawURL callback:[self callbackCreatingStringAndSendingTo:callback]];
}

- (void (^)(id, NSError *)) callbackCreatingStringAndSendingTo:(void (^)(NSString *, NSError *))callback
{
	return ^(NSData *data, NSError *error) {
		if (error)
		{
			callback(nil, error);
		}
		callback([[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding], error);
	};
}


- (void) getFollowersForUser:(TCUser *)user withCallback:(void (^)(NSArray *, NSError *))callback
{
	NSString *path = [NSString stringWithFormat:@"/users/%@/followers", user.login];
	[_server doGet:path withParameters:nil callback:[self callbackParsingCollectionOfClass:[TCUser class] andSendingTo:callback]];
}
- (void) getFollowingForUser:(TCUser *)user withCallback:(void (^)(NSArray *, NSError *))callback
{
	NSString *path = [NSString stringWithFormat:@"/users/%@/following", user.login];
	[_server doGet:path withParameters:nil callback:[self callbackParsingCollectionOfClass:[TCUser class] andSendingTo:callback]];
}

- (void) getStarredGistsWithCallback:(void (^)(NSArray *, NSError *))callback
{
	[_server doGet:@"/gists/starred" withParameters:nil callback:[self callbackParsingCollectionOfClass:[TCGist class] andSendingTo:callback]];
}

- (void) getInformationForUser:(TCUser *)user withCallback:(void (^)(TCUser *, NSError *))callback
{
	NSString *path = [NSString stringWithFormat:@"/users/%@", user.login];
	[_server doGet:path withParameters:nil callback:[self callbackParsingClass:[TCUser class] andSendingTo:callback]];
}
@end