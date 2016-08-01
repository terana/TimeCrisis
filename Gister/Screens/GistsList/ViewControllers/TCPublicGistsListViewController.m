//
// Created by Anastasia on 6/27/16.
//

#import "TCPublicGistsListViewController.h"
#import "TCUsersFilesListViewController.h"
#import "TCServerManager.h"
#import "TCPublicFilesListViewController.h"

@implementation TCPublicGistsListViewController
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
		self.title = @"Recent gists";
	}
	return self;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[TCServerManager shared] getPublicGistsWithCallback:^(NSArray *gists, NSError *error) {
		TCGistsListView *view = self.view;
		view.data             = gists;
	}];
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCPublicFilesListViewController *vc = [TCPublicFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end