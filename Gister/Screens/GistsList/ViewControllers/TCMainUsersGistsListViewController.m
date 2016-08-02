//
// Created by Anastasia on 7/19/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCMainUserFilesListViewController.h"
#import "TCServerManager.h"
#import "TCPresentationManager.h"

@interface TCMainUsersGistsListViewController () <TCGistsListViewDelegate>
@end

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
	[[TCPresentationManager shared] openNewGistScreenWithSender:self];
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
	[[TCPresentationManager shared] openMainUserFilesOfGist:gist withSender:self];
}
@end