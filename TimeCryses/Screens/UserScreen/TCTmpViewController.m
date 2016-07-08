//
// Created by Anastasia on 7/7/16.
//

#import "TCTmpViewController.h"
#import "TCUserPageView.h"
#import "NSDate+TCDateString.h"

@implementation TCTmpViewController
{
}

- (void) loadView
{
	TCUser *user = [TCUser new];
	user.avatar = [UIImage imageNamed:@"ninja_octocat"];
	user.login = @"login";
	user.gitURL = [NSURL URLWithString:@"http://github.com"];
	user.gistsURL = [NSURL URLWithString:@"http://github.com"];
	user.registrationDate = [NSDate dateFromString:@"01.10.10"];

	TCUserPageView *view = [[TCUserPageView alloc] initWithTopInset:self.navigationController.navigationBar.frame.size.height + 30];
	view.user = user;
	self.view = view;
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end