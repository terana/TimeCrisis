//
// Created by Anastasia on 7/19/16.
//

#import "TCUsersGistsListViewController.h"
#import "TCGistsListView.h"
#import "TCServerManager.h"
#import "TCUsersFilesListViewController.h"
#import "NSObject+TCDoWith.h"

@implementation TCUsersGistsListViewController
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
	TCUsersFilesListViewController *vc = [TCUsersFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end