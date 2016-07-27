//
// Created by Anastasia on 7/26/16.
//

#import "TCUserProfileViewController.h"
#import "TCMainUsersGistsListViewController.h"
#import "TCServerManager.h"
#import "TCUsersListViewController.h"
#import "TCOtherUsersProfileView.h"

@implementation TCUserProfileViewController
{
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	TCOtherUsersProfileView *view = self.view;
	view.user = self.user;
	[self reloadInputViews];
}

- (void) openGists
{
	NSAssert(0, @"Should be implemented in subckass");
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
	}];
}
@end