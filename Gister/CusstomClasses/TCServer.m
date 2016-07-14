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
	[request setURL:[NSURL URLWithString:_serverURL]];
	[request setHTTPMethod:@"GET"];
	for (NSString *key in parameters)
	{
		[request setValue:parameters[key] forHTTPHeaderField:key];
	}
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSDictionary *requestReply = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
		//callback(requestReply, error);
	}] resume];
}
@end