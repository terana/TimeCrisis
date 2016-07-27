//
// Created by Anastasia on 7/26/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCGistsListView.h"
#import "TCServerManager.h"
#import "TCUsersFilesListViewController.h"
#import "TCOtherUsersGistListViewController.h"
#import "TCPublicFilesListViewController.h"

@implementation TCOtherUsersGistsListViewController
{
}
+ (Class) viewClass
{
	return [TCGistsListView class];
}

- (instancetype) init
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
	TCPublicFilesListViewController *vc = [TCPublicFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end