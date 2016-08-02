//
// Created by Anastasia on 7/12/16.
//

#import "TCMainUserProfileViewController.h"
#import "TCMainUserProfileView.h"
#import "TCServerManager.h"
#import "UIViewController+ShowError.h"
#import "TCPresentationManager.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@interface TCMainUserProfileViewController () <TCMainUserProfileViewDelegate>
@end;

@implementation TCMainUserProfileViewController
{
	TCUser                  *_user;
	UIActivityIndicatorView *_activityIndicator;
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

	__unused UIActivityIndicatorView *activityIndicator = _activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] tc_with:^(UIActivityIndicatorView *o) {
		o.hidden           = YES;
		o.color            = [UIColor grayColor];
		o.hidesWhenStopped = YES;
		[self.view addSubview:o];
		o.keepCenter.equal = 0.5;
	}];
	[_activityIndicator startAnimating];
	[[TCServerManager shared] getInformationForMainUserWithCallback:^(TCUser *user, NSError *error) {
		[_activityIndicator stopAnimating];
		if (error == nil)
		{
			_user                       = user;
			TCMainUserProfileView *view = (TCMainUserProfileView *) self.view;
			view.user = user;
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
	[[TCPresentationManager shared] openMainUserGistsWithSender:self];
}

- (void) openStarred
{
	[_activityIndicator startAnimating];
	[[TCServerManager shared] getStarredGistsWithCallback:^(NSArray *gists, NSError *error) {
		[_activityIndicator stopAnimating];
		if (error == nil)
		{
			[[TCPresentationManager shared] openStarredGists:gists withSender:self];
		}
		else
		{
			[self showMessageWithError:error callback:nil];
		}
	}];
}

- (void) openFollowers
{
	[_activityIndicator startAnimating];
	[[TCServerManager shared] getFollowersForUser:_user withCallback:^(NSArray *users, NSError *error) {
		[_activityIndicator stopAnimating];
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
	[_activityIndicator startAnimating];
	[[TCServerManager shared] getFollowingForUser:_user withCallback:^(NSArray *users, NSError *error) {
		[_activityIndicator stopAnimating];
		if (!error)
		{
			[[TCPresentationManager shared] openFollowing:users withSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end