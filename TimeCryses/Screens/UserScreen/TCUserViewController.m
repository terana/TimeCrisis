//
// Created by Anastasia on 7/6/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCUserViewController.h"
#import "TCUser.h"
#import "NSDate+TCDateString.h"
#import "NSObject+TCDoWith.h"
#import "TCImageView.h"
#import "TCUserPageView.h"
#import "NSDictionary+DictionaryWithoutNSNull.h"

@implementation TCUserViewController
{
}

- (void) loadView
{
	NSURL        *url        = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/user?access_token=%@", _authenticationParametrs[@"access_token"]]];
	//NSURL        *url        = [NSURL URLWithString:@"https://api.github.com/user?access_token=8322ba05bd52fb90b32421c132f73070d61ca532"];
	NSData       *userData   = [[NSData alloc] initWithContentsOfURL:url];
	NSError      *error      = nil;
	NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:userData options:kNilOptions error:&error];
	parsedData = [parsedData dictionaryWithoutNSNull];
	TCUser *user = [TCUser new];

	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:parsedData[@"avatar_url"]]];
	user.avatar = [[UIImage alloc] initWithData:imageData];
	user.login = parsedData[@"login"];
	user.followersURL = [NSURL URLWithString:parsedData[@"followers_url"]];
	user.followingsURL = [NSURL URLWithString:parsedData[@"following_url"]];
	user.gitURL = [NSURL URLWithString:parsedData[@"url"]];
	user.gistsURL = [NSURL URLWithString:parsedData[@"gists_url"]];
	user.registrationDate = [NSDate dateFromStringWithTime:parsedData[@"created_at"]];

	TCUserPageView *view = [[TCUserPageView alloc] initWithTopInset:self.navigationController.navigationBar.frame.size.height + 30];
	view.user = user;
	self.view = view;
}

- (void) updateOnClassInjection
{
	[self loadView];
}

@end