//
// Created by Anastasia on 7/12/16.
//

#import "TCProfileScreenViewController.h"
#import "TCProfileScreenView.h"
#import "TCServerManager.h"
#import "TCPublicGistsListViewController.h"
#import "TCUsersGistListViewController.h"

@implementation TCProfileScreenViewController
{
}

-(instancetype)init
{
	self = [super init];
	if (self)
	{
		UITabBarItem *tabBarItem = [self tabBarItem];

		[tabBarItem setTitle:@"My profile"];
	}
	return self;
}

- (void) viewWillAppear:(BOOL)animated
{
	[[TCServerManager shared] getInformationForUserWithCallback:^(TCUser *user, NSError *error) {
		if (user)
		{
			_user                     = user;
			TCProfileScreenView *view = self.view;
			view.user = _user;
			[[NSUserDefaults standardUserDefaults] setObject:user.login forKey:@"login"];
		}
	}];
}

- (void) openGists
{
	TCUsersGistListViewController *vc = [TCUsersGistListViewController new];
	vc.user = _user;
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) openFollowers
{
}

- (void) openFollowing
{
}

- (void) openStarred
{
}

@end