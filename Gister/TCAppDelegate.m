//
// Created by Anastasia on 6/20/16.
//

#import "TCAppDelegate.h"
#import "TCMainMenuViewController.h"
#import "NSDictionary+TCParseURL.h"
#import "TCAuthenticationViewController.h"
#import "TCUserViewController.h"
#import "TCTmpViewController.h"
#import "TCTableViewController.h"

@implementation TCAppDelegate
{
	__strong UIWindow      *_window;
	UINavigationController *_navigationController;
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UIWindow               *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	//UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCAuthenticationViewController new]];
	//UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCTableViewController new]];
	UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCTmpViewController new]];
	[nc setNavigationBarHidden:NO animated:YES];

	window.rootViewController = _navigationController = nc;
	[window makeKeyAndVisible];
	_window = window;
	return YES;
}

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
	NSDictionary             *parametrs = [NSDictionary dictionaryFromURLString:url.absoluteString];
	NSURL *tokenURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/access_token"
																		@"?client_id=dc665db234579172b3b8"
																		@"&client_secret=fb76ebe1be54a5b1b37981af7dc4950b0b9af8df"
																		@"&code=%@"
																		@"&redirect_uri=gister://"
																		@"&state=1234", parametrs[@"code"]]];

	NSData *tokenURLData = [[NSData alloc] initWithContentsOfURL:tokenURL];
	NSString *tokenURLString = [[NSString alloc] initWithData:tokenURLData encoding:NSNonLossyASCIIStringEncoding];
	NSDictionary *tokenParametrs = [NSDictionary dictionaryFromURLString:tokenURLString];

	TCMainMenuViewController *vc        = [TCMainMenuViewController new];
	vc.authenticationParametrs = tokenParametrs;
	NSLog(@"#### access_token=%@ ####", tokenParametrs[@"access_token"]);
	[_navigationController pushViewController:vc animated:YES];
	return NO;
}
@end