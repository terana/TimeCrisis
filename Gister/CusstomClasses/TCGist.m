//
// Created by Anastasia on 6/29/16.
//

#import "TCGist.h"
#import "NSDate+TCDateString.h"
#import "TCFile.h"
#import "TCUser.h"

@implementation TCGist
{
}
+ (instancetype) unmap:(NSDictionary *)dictionary
{
	TCGist *gist = [TCGist new];
	gist.id              = dictionary[@"id"];
	gist.creationDate    = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
	gist.updatingDate    = [NSDate dateFromStringWithTime:dictionary[@"updated_at"]];
	gist.gistDescription = dictionary[@"description"];
	gist.public = (BOOL)dictionary[@"public"];
	NSMutableArray *files = [NSMutableArray new];
	for (id        dictFile in [dictionary[@"files"] allValues])
	{
		TCFile *file = [TCFile new];
		file.filename = dictFile[@"filename"];
		file.rawURL   = dictFile[@"raw_url"];
		file.gist     = gist;
		[files addObject:file];
	}
	gist.files            = files;
	NSDictionary *owner = dictionary[@"owner"];
	gist.owner = [TCUser unmap:owner];
	return gist;
}
@end