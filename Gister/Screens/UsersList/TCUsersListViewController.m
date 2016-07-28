//
// Created by Anastasia on 7/26/16.
//

#import "TCUsersListViewController.h"
#import "TCUsersListView.h"
#import "TCMainUserProfileViewController.h"
#import "TCOtherUsersProfileViewController.h"
#import "TCServerManager.h"

@implementation TCUsersListViewController
{
}
- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	TCUsersListView *view = self.view;
	view.users = _users;
}

- (void) openProfileOfUser:(TCUser *)user
{
	[[TCServerManager shared] getInformationForUser:user withCallback:^(TCUser *userWithFullInformation, NSError *error){
		TCOtherUsersProfileViewController *vc = [TCOtherUsersProfileViewController new];
		vc.user = userWithFullInformation;
		[[self navigationController] pushViewController:vc animated:YES];
	}];

}
@end