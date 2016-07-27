//
// Created by Anastasia on 7/19/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCGistsListView.h"
#import "TCUsersFilesListViewController.h"
#import "TCServerManager.h"
#import "TCCreatingGistViewController.h"

@implementation TCMainUsersGistsListViewController
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

		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewGist)];
	}
	return self;
}

- (void) createNewGist
{
	TCCreatingGistViewController *vc = [TCCreatingGistViewController new];
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
	[self reloadInputViews];
	[super viewWillAppear:animated];
	TCGistsListView *view = self.view;
	view.data = _gists;
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCUsersFilesListViewController *vc = [TCUsersFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end