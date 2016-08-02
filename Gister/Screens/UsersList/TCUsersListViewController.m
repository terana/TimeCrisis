//
// Created by Anastasia on 7/26/16.
//

#import "TCUsersListViewController.h"
#import "TCMainUserProfileViewController.h"
#import "TCOtherUsersProfileViewController.h"
#import "TCServerManager.h"

@interface TCUsersListViewController () <TCUsersListViewDelegate>
@end

@implementation TCUsersListViewController
{
}

- (void) openProfileOfUser:(TCUser *)user
{
	[[TCServerManager shared] getInformationForUser:user withCallback:^(TCUser *userWithFullInformation, NSError *error) {
		TCOtherUsersProfileViewController *vc = [TCOtherUsersProfileViewController new];
		vc.user = userWithFullInformation;
		[[self navigationController] pushViewController:vc animated:YES];
	}];
}

- (void) setUsers:(NSArray *)users
{
	_users = users;
	TCUsersListView *view = (TCUsersListView *) self.view;
	view.users = users;
}
@end