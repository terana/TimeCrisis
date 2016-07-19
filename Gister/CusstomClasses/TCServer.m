//
// Created by Anastasia on 7/12/16.
//

#import "TCServer.h"

@implementation TCServer
{
	NSString *_serverURL;
}
- (instancetype) initWithServerURL:(NSString *)URL
{
	self = [super init];
	if (self)
	{
		_serverURL = URL;
	}
	return self;
}

- (void) doGet:(NSString *)path withParameters:(NSDictionary *)parameters callback:(void (^)(id, NSError *))callback
{
	NSMutableURLRequest *request = [NSMutableURLRequest new];
	NSString            *url     = [_serverURL stringByAppendingString:path];
	if (parameters)
	{
		url = [url stringByAppendingString:@"?"];
		for (NSString *key in parameters)
		{
			url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, parameters[key]]];
		}
	}
	NSLog(@"%@", url);
	[request setURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *error1 = nil;
		id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
		callback(result, error);
	}] resume];
}

- (void) doGetWithURL:(NSString *)url callback:(void (^)(id, NSError *))callback
{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		callback(data, error);
	}] resume];
}
@end