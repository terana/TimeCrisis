//
// Created by Anastasia on 7/7/16.
//

#import "TCTmpViewController.h"
#import "TCUserPageView.h"
#import "NSDate+TCDateString.h"
#import "TCGist.h"
#import "TCTableWithGistsViewController.h"
#import "TCTableWithGistFilesViewController.h"

@implementation TCTmpViewController
{
	TCUser *_user;
}

- (void) loadView
{
	TCUser *user = [TCUser new];
	user.avatar = [UIImage imageNamed:@"ninja_octocat"];
	user.login = @"login";
	user.gitURL = [NSURL URLWithString:@"http://github.com"];
	user.gistsURL = [NSURL URLWithString:@"http://github.com"];
	user.registrationDate = [NSDate dateFromString:@"01.10.10"];
	_user = user;
	TCUserPageView *view = [[TCUserPageView alloc] initWithTopInset:self.navigationController.navigationBar.frame.size.height + 30];
	view.user = user;
	view.delegate = self;
	self.view = view;
}

- (void) openGitHubPage:(NSURL *)url
{
	[[UIApplication sharedApplication] openURL:url];
}

- (void) openFollowers:(NSURL *)followers_url
{
}

- (void) openFollowings:(NSURL *)following_url
{
}

- (void) openGistsList:(UIView *)sender
{
	TCTableWithGistsViewController *vc = [TCTableWithGistsViewController new];
	vc.gistsURL = _user.gistsURL;
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) openGist:(TCGist *)gist
{
	TCTableWithGistFilesViewController *vc = [TCTableWithGistFilesViewController new];
	vc.gist = gist;
	[[self navigationController] pushViewController:vc animated:YES];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end