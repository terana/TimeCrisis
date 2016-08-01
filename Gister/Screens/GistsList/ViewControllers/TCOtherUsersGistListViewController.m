//
// Created by Anastasia on 7/26/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCGistsListView.h"
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

- (void) setGists:(NSArray *)gists
{
	TCGistsListView *view = (TCGistsListView *) self.view;
	view.data = gists;
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCPublicFilesListViewController *vc = [TCPublicFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end