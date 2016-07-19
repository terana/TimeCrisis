//
// Created by Anastasia on 6/27/16.
//

#import "TCPublicGistsListViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCGistsListView.h"
#import "NSDate+TCDateString.h"
#import "NSDictionary+DictionaryWithoutNSNull.h"
#import "TCTableWithGistFilesViewController.h"
#import "TCFile.h"

@implementation TCPublicGistsListViewController
{
}
- (void) loadView
{
	self.title = @"Gists";
	self.view  = [TCGistsListView tc_with:^(TCGistsListView *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}


- (void) viewDidLoad
{
	NSData              *urlData    = [[NSData alloc] initWithContentsOfURL:_gistsURL];
	NSError             *error      = nil;
	NSArray             *parsedData = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
	NSMutableArray      *gistsArray = [NSMutableArray new];
	for (id             object in parsedData)
	{
		TCGist       *gist       = [TCGist new];
		NSDictionary *dictionary = [object dictionaryWithoutNSNull];
		gist.id              = dictionary[@"id"];
		gist.creationDate    = [NSDate dateFromStringWithTime:dictionary[@"created_at"]];
		gist.updatingDate    = [NSDate dateFromStringWithTime:dictionary[@"updated_at"]];
		gist.gistDescription = dictionary[@"description"];
		NSMutableArray *files = [NSMutableArray new];
		for (id        dictFile in [dictionary[@"files"] allValues])
		{
			TCFile *file = [TCFile new];
			file.filename = dictFile[@"filename"];
			NSString *str = dictFile[@"size"];
			file.fileSize = [str integerValue];
			file.fileType = dictFile[@"type"];
			file.language = dictFile[@"language"];
			file.rawURL   = [NSURL URLWithString:dictFile[@"raw_url"]];
			[files addObject:file];
		}
		gist.files            = files;
		[gistsArray addObject:gist];
	}
	TCGistsListView *view       = self.view;
	view.delegate = self;
	view.data     = gistsArray;
}

-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

}

- (void) gistIsSelected:(TCGist *)gist
{
	TCTableWithGistFilesViewController *vc = [TCTableWithGistFilesViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end