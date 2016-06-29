//
// Created by Anastasia on 6/27/16.
//

#import "TCTableWithGistsViewController.h"
#import "TCViewWithUserTable.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithGistTable.h"
#import "TCGist.h"
#import "NSDate+TCDateString.h"

@implementation TCTableWithGistsViewController
{
}
- (void) loadView
{
	self.view = [TCViewWithGistTable tc_with:^(TCViewWithGistTable *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	NSData  *urlData    = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://api.github.com/gists/public"]];
	NSError *error      = nil;
	NSArray *parsedData = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
	NSMutableArray *gistsArray = [NSMutableArray new];
	NSUInteger i;
	NSUInteger count = parsedData.count;
	id(^stripNull)(NSString *) = ^(NSString *key){
		id obj = parsedData[i][key];
		return obj == [NSNull null] ? nil : obj;
	};
	for(i = 0; i < count; i++)
	{
		TCGist *gist = [TCGist new];
		gist.url = [NSURL URLWithString:stripNull(@"url")];
		gist.id = stripNull(@"id");
		gist.creationDate = [NSDate dateFromStringWithTime:stripNull(@"created_at")];
		gist.updatingDate = [NSDate dateFromStringWithTime:stripNull(@"updated_at")];
		[gistsArray addObject:gist];
	}
	TCViewWithGistTable *view = self.view;
	view.data = gistsArray;
}
@end