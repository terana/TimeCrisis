//
// Created by Anastasia on 7/19/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCUsersFilesListViewController.h"
#import "TCServerManager.h"
#import "TCCreatingGistViewController.h"
#import "TCPresentationManager.h"

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
		self.title = @"My gists";

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
	[super viewWillAppear:animated];

	[[TCServerManager shared] getGistsForMainUserWithCallback:^(NSArray *gists, NSError *error) {
		if (error == nil)
		{
			TCGistsListView *view = (TCGistsListView *) self.view;
			view.data = gists;
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCUsersFilesListViewController *vc = [TCUsersFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end