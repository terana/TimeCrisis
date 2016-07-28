//
// Created by Anastasia on 7/12/16.
//

#import "TCMainUserProfileViewController.h"
#import "TCMainUserProfileView.h"
#import "TCServerManager.h"
#import "TCPublicGistsListViewController.h"
#import "TCAuthenticationScreenViewController.h"
#import "UIViewController+ShowError.h"
#import "TCMainUsersGistsListViewController.h"
#import "TCGistsListView.h"
#import "TCUsersListViewController.h"

@implementation TCMainUserProfileViewController
{
}

- (void) viewWillAppear:(BOOL)animated
{
	[self reloadInputViews];
	[super viewWillAppear:animated];
	self.title = @"My Profile";
	[[TCServerManager shared] getInformationForMainUserWithCallback:^(TCUser *user, NSError *error) {
		if (error == nil)
		{
			self.user                   = user;
			TCMainUserProfileView *view = self.view;
			view.user = self.user;
		}
		else
		{
			[self showMessageWithError:error callback:^{
				[[self navigationController] popViewControllerAnimated:YES];
			}];
		}
	}];
}

- (void) signOut
{
	NSHTTPCookie        *cookie;
	NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
	for (cookie in [storage cookies])
	{
		NSLog(@"%@", cookie);
		[storage deleteCookie:cookie];
	}
	TCAuthenticationScreenViewController *vc = [TCAuthenticationScreenViewController new];
	vc.hidesBottomBarWhenPushed = YES;
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) openGists
{
	[[TCServerManager shared] getGistsForUser:_user callback:^(NSArray *gists, NSError *error) {
		if (error == nil)
		{
			TCMainUsersGistsListViewController *vc = [TCMainUsersGistsListViewController new];
			vc.gists = gists;
			[[self navigationController] pushViewController:vc animated:YES];
		}
	}];
}
- (void) openStarred
{
	[[TCServerManager shared] getStarredGistsWithCallback:^(NSArray *gists, NSError *error){
		if(error == nil)
		{
			TCMainUsersGistsListViewController *vc = [TCMainUsersGistsListViewController new];
			vc.gists                               = gists;
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else {
			[self showMessageWithError:error callback:^(){}];
		}
	}];
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
			vc.title = @"Following";
			[[self navigationController] pushViewController:vc animated:YES];
		}
	}];
}
@end