//
// Created by Anastasia on 6/30/16.
//

#import "NSDictionary+DictionaryWithoutNSNull.h"

@implementation NSDictionary (DictionaryWithoutNSNull)
- (NSDictionary *) dictionaryWithoutNSNull
{
	NSMutableDictionary *dictionary = [NSMutableDictionary new];

	for (id object in [self allValues])
	{
		if (object != [NSNull null] && object != nil)
		{
			if ([object isMemberOfClass:[NSDictionary class]])
			{
				NSDictionary *dictionaryObject = [self dictionaryWithoutNSNull];
				for (id      key in [self allKeysForObject:object])
				{
					dictionary[key] = dictionaryObject;
				}
			}
			else
			{
				for (id key in [self allKeysForObject:object])
				{
					dictionary[key] = object;
				}
			}
		}
		else
		{
			for (id key in [self allKeysForObject:object])
			{
				dictionary[key] = nil;
			}
		}
	}
	return dictionary;
}
@end