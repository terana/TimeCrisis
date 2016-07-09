//
// Created by Anastasia on 7/5/16.
//

#import "NSDictionary+TCParseURL.h"

@implementation NSDictionary (TCParseURL)
+ (NSDictionary *) dictionaryFromURLString:(NSString *)urlString
{
	NSRange range = [urlString rangeOfString:@"?"];
	if(range.location != NSNotFound )
	{
		urlString = [urlString substringFromIndex:range.location + 1];
	}
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