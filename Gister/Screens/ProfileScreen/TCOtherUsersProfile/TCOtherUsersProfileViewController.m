//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileViewController.h"
#import "TCOtherUsersProfileView.h"
#import "TCOtherUsersGistListViewController.h"
#import "TCServerManager.h"
#import "TCUsersListViewController.h"
#import "UIViewController+ShowError.h"

@interface TCOtherUsersProfileViewController () <TCOtherUsersProfileViewDelegate>
@end

@implementation TCOtherUsersProfileViewController
{
}

- (void) viewWillAppear:(BOOL)animated
{
	[self reloadInputViews];
	[super viewWillAppear:animated];

	TCOtherUsersProfileView *view = self.view;
	view.user = self.user;
}

- (void) openGists
{
	TCOtherUsersGistsListViewController *vc = [TCOtherUsersGistsListViewController new];
	vc.user = _user;
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	TCOtherUsersProfileView *view = self.view;
	view.user = self.user;
	[self reloadInputViews];
}

- (void) openFollowers
{
	[[TCServerManager shared] getFollowersForUser:_user withCallback:^(NSArray *users, NSError *error) {
		if (!error)
		{
			TCUsersListViewController *vc = [TCUsersListViewController new];
			vc.users = users;
			vc.title = @"Followers";
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}

- (void) openFollowing
{
	[[TCServerManager shared] getFollowingForUser:_user withCallback:^(NSArray *users, NSError *error) {
		if (!error)
		{
			TCUsersListViewController *vc = [TCUsersListViewController new];
			vc.users = users;
			vc.title = @"Followings";
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}
@end