//
// Created by Anastasia on 7/19/16.
//

#import "TCUsersGistListViewController.h"
#import "TCGistsListView.h"
#import "TCServerManager.h"
#import "TCTableWithGistFilesViewController.h"

@implementation TCUsersGistListViewController
{
}
+ (Class) viewClass
{
	return [TCGistsListView class];
}

-(instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Gists";
	}
	return self;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[[TCServerManager shared] getGistsForUser:_user callback:^(NSArray *gists, NSError *error) {
		if (error == nil)
		{
			TCGistsListView *view = self.view;
			view.data = gists;
		}
	}];
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCTableWithGistFilesViewController *vc = [TCTableWithGistFilesViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end