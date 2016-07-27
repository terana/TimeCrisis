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

@implementation TCMainUserProfileViewController
{
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"My Profile";
	[[TCServerManager shared] getInformationForUserWithCallback:^(TCUser *user, NSError *error) {
		if (error == nil)
		{
			self.user                   = user;
			TCMainUserProfileView *view = self.view;
			view.user = self.user;
			[[NSUserDefaults standardUserDefaults] setObject:user.login forKey:@"login"];
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
@end