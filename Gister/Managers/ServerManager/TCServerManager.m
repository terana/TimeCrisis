//
// Created by Anastasia on 7/12/16.
//

#import "TCServerManager.h"
#import "TCServer.h"
#import "NSDictionary+DictionaryWithoutNSNull.h"
#import "NSDictionary+TCParseURL.h"
#import "TCViewController.h"
#import "TCPresentationManager.h"

static const NSString *const clientID     = @"dc665db234579172b3b8";
static const NSString *const clientSecret = @"fb76ebe1be54a5b1b37981af7dc4950b0b9af8df";

@implementation TCServerManager
{
	TCServer *_server;
	NSString *_accessToken;
	NSString *_mainUserLogin;
	void (^_callback)(NSError *);
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
		_server      = [[TCServer alloc] initWithServerURL:@"https://api.github.com"];
		_accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"access_tocken"];
	}
	return self;
}

- (BOOL) foundAccessToken
{
	return (_accessToken != nil);
}

- (void) signInFromViewController:(TCViewController *)viewController callback:(void (^)(NSError *))callback
{
	BOOL (^blockForWebViewTryingLoadRequest)(NSURLRequest *) = ^(NSURLRequest *request) {
		NSString *url  = request.URL.absoluteString;
		NSLog(@"%@", url);
		NSRange  range = [url rangeOfString:@"code"];
		if (range.location == NSNotFound)
		{
			return YES;
		}
		[self getAccessParametersFromURL:url withCallback:callback];
		return NO;
	};
	[[TCPresentationManager shared] openAuthenticationWebViewWithSender:viewController callback:blockForWebViewTryingLoadRequest];
}

- (NSURLRequest *) requestForWebView
{
	NSURL               *url     = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/authorize/?"
			                                                                               @"client_id=%@"
			                                                                               @"&redirect_uri=gister://"
			                                                                               @"&scope=user%%2Cgist"
			                                                                               @"&state=1234"
			                                                                               @"&allow_signup=true", clientID]];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPShouldHandleCookies:YES];
	return request;
}

- (void) getAccessParametersFromURL:(NSString *)url withCallback:(void (^)(NSError *error))callback
{
	NSDictionary *parameters = [NSDictionary dictionaryFromURLString:url];
	NSString     *tokenURL   = [NSString stringWithFormat:@"https://github.com/login/oauth/access_token"
			                                                      @"?client_id=%@"
			                                                      @"&client_secret=%@"
			                                                      @"&code=%@"
			                                                      @"&redirect_uri=gister://"
			                                                      @"&state=1234", clientID, clientSecret, parameters[@"code"]];

	NSData       *data            = [NSData dataWithContentsOfURL:[NSURL URLWithString:tokenURL]];
	NSString     *tokenURLString  = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	NSDictionary *tokenParameters = [NSDictionary dictionaryFromURLString:tokenURLString];
	if (tokenParameters[@"access_token"])
	{
		_accessToken = tokenParameters[@"access_token"];
		[[NSUserDefaults standardUserDefaults] setObject:_accessToken forKey:@"access_token"];
		callback(nil);
		return;
	}
	NSMutableDictionary *details = [NSMutableDictionary dictionary];
	[details setValue:@"Authentication failed" forKey:NSLocalizedDescriptionKey];
	NSError *error = [[NSError alloc] initWithDomain:@"access" code:1 userInfo:details];
	callback(error);
}

- (void) dropCookies
{
	NSHTTPCookie        *cookie;
	NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
	for (cookie in [storage cookies])
	{
		[storage deleteCookie:cookie];
	}
	_accessToken = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"access_token"];
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
	if ([primitives isKindOfClass:[NSDictionary class]])
	{
		primitives = [primitives dictionaryWithoutNSNull];
	}
	return [cl unmap:primitives];
};

- (void) getGistsForMainUserWithCallback:(void (^)(NSArray *, NSError *))callback
{
	NSString *path = [NSString stringWithFormat:@"/users/%@/gists", _mainUserLogin];
	[_server doGet:path withParameters:nil callback:[self callbackParsingCollectionOfClass:[TCGist class] andSendingTo:callback]];
}

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