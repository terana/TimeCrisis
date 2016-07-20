//
// Created by Anastasia on 7/12/16.
//

#import "TCProfileScreenViewController.h"
#import "TCProfileScreenView.h"
#import "TCServerManager.h"
#import "TCPublicGistsListViewController.h"
#import "TCUsersGistsListViewController.h"
#import "TCAuthenticationScreenViewController.h"

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
		if (error == nil)
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
	TCUsersGistsListViewController *vc = [TCUsersGistsListViewController new];
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

- (void) signOut
{
	NSHTTPCookie *cookie;
	NSHTTPCookieStorage *storage =[NSHTTPCookieStorage sharedHTTPCookieStorage];
	for (cookie in [storage cookies]) {
		NSLog(@"%@",cookie);
		[storage deleteCookie:cookie];
	}
	TCAuthenticationScreenViewController *vc = [TCAuthenticationScreenViewController new];
	[[self navigationController] pushViewController:vc animated:YES];
}
@end