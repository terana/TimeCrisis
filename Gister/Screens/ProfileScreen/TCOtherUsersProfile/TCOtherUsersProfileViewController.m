//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileViewController.h"
#import "TCOtherUsersProfileView.h"
#import "TCOtherUsersGistListViewController.h"

@implementation TCOtherUsersProfileViewController
{
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	TCOtherUsersProfileView *view = self.view;
	view.user = self.user;
}

-(void)openGists
{
	TCOtherUsersGistsListViewController *vc = [TCOtherUsersGistsListViewController new];
	vc.user = _user;
	[[self navigationController] pushViewController:vc animated:YES];
}
@end