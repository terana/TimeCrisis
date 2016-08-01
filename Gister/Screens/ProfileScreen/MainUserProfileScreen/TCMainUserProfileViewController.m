//
// Created by Anastasia on 7/12/16.
//

#import "TCMainUserProfileViewController.h"
#import "TCMainUserProfileView.h"
#import "TCServerManager.h"
#import "TCPublicGistsListViewController.h"
#import "UIViewController+ShowError.h"
#import "TCMainUsersGistsListViewController.h"
#import "TCUsersListViewController.h"
#import "TCPresentationManager.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@interface TCMainUserProfileViewController () <TCMainUserProfileViewDelegate>
@end;

@implementation TCMainUserProfileViewController
{
	TCUser *_user;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"My Profile";
	}
	return self;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	__unused UIActivityIndicatorView *activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] tc_with:^(UIActivityIndicatorView *o) {
		o.hidden           = YES;
		o.color            = [UIColor grayColor];
		o.hidesWhenStopped = YES;
		[self.view addSubview:o];
		o.keepCenter.equal = 0.5;
	}];
	[activityIndicator startAnimating];
	[[TCServerManager shared] getInformationForMainUserWithCallback:^(TCUser *user, NSError *error) {
		[activityIndicator stopAnimating];
		if (error == nil)
		{
			_user                       = user;
			TCMainUserProfileView *view = self.view;
			view.user = _user;
		}
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}

- (void) signOut
{
	[[TCServerManager shared] dropCookies];
	[[TCPresentationManager shared] openInitialView];
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
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}

- (void) openStarred
{
	[[TCServerManager shared] getStarredGistsWithCallback:^(NSArray *gists, NSError *error) {
		if (error == nil)
		{
			TCMainUsersGistsListViewController *vc = [TCMainUsersGistsListViewController new];
			vc.gists = gists;
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else
		{
			[self showMessageWithError:error callback:nil];
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
			vc.title = @"Following";
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}
@end