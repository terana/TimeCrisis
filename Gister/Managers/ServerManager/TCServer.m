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
	NSString *str = [NSString stringWithFormat:@"token %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]];
	[request setValue:str forHTTPHeaderField:@"Authorization"];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *error1 = nil;
		id      result;
		if (data)
		{
			result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(result, error);
		});
	}] resume];
}

- (void) doGetWithURL:(NSString *)url callback:(void (^)(id, NSError *))callback
{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"GET"];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(data, error);
		});
	}] resume];
}

- (void) doPost:(NSString *)path withParameters:(NSDictionary *)parameters body:(NSDictionary *)body callback:(void (^)(id, NSError *))callback
{
	NSString *url = [_serverURL stringByAppendingString:path];
	if (parameters)
	{
		url = [url stringByAppendingString:@"?"];
		for (NSString *key in parameters)
		{
			url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, parameters[key]]];
		}
	}
	NSLog(@"POST: %@", url);

	NSError *error2      = nil;
	NSData  *requestData = [NSJSONSerialization dataWithJSONObject:body options:kNilOptions error:&error2];

	NSMutableURLRequest *request = [NSMutableURLRequest new];
	[request setHTTPMethod:@"POST"];
	[request setURL:[NSURL URLWithString:url]];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	NSString *str = [NSString stringWithFormat:@"token %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]];
	[request setValue:str forHTTPHeaderField:@"Authorization"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-length"];
	[request setHTTPBody:requestData];

	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *error1 = nil;
		id      result  = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];// TODO
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(result, error);
		});
	}] resume];
}

- (void) doPatch:(NSString *)path withParameters:(NSDictionary *)parameters body:(NSDictionary *)body callback:(void (^)(id, NSError *))callback
{
	NSString *url = [_serverURL stringByAppendingString:path];
	if (parameters)
	{
		url = [url stringByAppendingString:@"?"];
		for (NSString *key in parameters)
		{
			url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, parameters[key]]];
		}
	}
	NSLog(@"PATCH: %@", url);

	NSError *error2      = nil;
	NSData  *requestData = [NSJSONSerialization dataWithJSONObject:body options:kNilOptions error:&error2];

	NSMutableURLRequest *request = [NSMutableURLRequest new];
	[request setHTTPMethod:@"PATCH"];
	[request setURL:[NSURL URLWithString:url]];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	NSString *str = [NSString stringWithFormat:@"token %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]];
	[request setValue:str forHTTPHeaderField:@"Authorization"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-length"];
	NSLog(@"%@", request.allHTTPHeaderFields);
	[request setHTTPBody:requestData];

	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		id result;
		if (!error)
		{
			NSError *error1 = nil;
			result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];// TODO
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(result, error);
		});
	}] resume];
}

- (void) doDelete:(NSString *)path withParameters:(NSDictionary *)parameters callback:(void (^)(NSError *))callback
{
	NSString *url = [_serverURL stringByAppendingString:path];
	if (parameters)
	{
		url = [url stringByAppendingString:@"?"];
		for (NSString *key in parameters)
		{
			url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, parameters[key]]];
		}
	}
	NSLog(@"PATCH: %@", url);

	NSMutableURLRequest *request = [NSMutableURLRequest new];
	[request setHTTPMethod:@"DELETE"];
	[request setURL:[NSURL URLWithString:url]];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	NSString *token = [NSString stringWithFormat:@"token %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]];
	[request setValue:token forHTTPHeaderField:@"Authorization"];

	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(error);
		});
	}] resume];
}
@end