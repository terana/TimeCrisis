//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileViewController.h"
#import "TCOtherUsersProfileView.h"
#import "TCServerManager.h"
#import "TCPresentationManager.h"

@interface TCOtherUsersProfileViewController () <TCOtherUsersProfileViewDelegate>
@end

@implementation TCOtherUsersProfileViewController
{
}

//- (void) viewWillAppear:(BOOL)animated
//{
//	[super viewWillAppear:animated];
//
//	TCOtherUsersProfileView *view = self.view;
//	view.user = self.user;
//}

- (void) setUser:(TCUser *)user
{
	_user = user;

	TCOtherUsersProfileView *view = (TCOtherUsersProfileView *) self.view;
	view.user = self.user;
}

- (void) openGists
{
	[[TCServerManager shared] getGistsForUser:_user callback:^(NSArray *gists, NSError *error) {
		if (error == nil)
		{
			[[TCPresentationManager shared] openOtherUserGists:gists withSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}

- (void) openFollowers
{
	[[TCServerManager shared] getFollowersForUser:_user withCallback:^(NSArray *users, NSError *error) {
		if (!error)
		{
			[[TCPresentationManager shared] openFollowers:users withSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}

- (void) openFollowing
{
	[[TCServerManager shared] getFollowingForUser:_user withCallback:^(NSArray *users, NSError *error) {
		if (!error)
		{
			[[TCPresentationManager shared] openFollowers:users withSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end