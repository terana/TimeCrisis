//
// Created by Anastasia on 7/5/16.
//

#import "NSDictionary+TCParseURL.h"

@implementation NSDictionary (TCParseURL)
+ (NSDictionary *) dictionaryFromURLString:(NSString *)urlString
{
	NSArray             *keyValuePairs = [urlString componentsSeparatedByString:@"&"];
	NSMutableDictionary *parametrs     = [NSMutableDictionary new];
	for (NSString       *keyValueString in keyValuePairs)
	{
		NSArray *keyValueArray = [keyValueString componentsSeparatedByString:@"="];
		parametrs[keyValueArray[0]] = keyValueArray[1];
	}
	return parametrs;
}
@end