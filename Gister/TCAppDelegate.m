//
// Created by Anastasia on 6/20/16.
//

#import "TCAppDelegate.h"
#import "NSDictionary+TCParseURL.h"
#import "TCAuthenticationScreenViewController.h"
#import "TCPublicGistsListViewController.h"
#import "TCMainUserProfileViewController.h"

@implementation TCAppDelegate
{
	__strong UIWindow      *_window;
	UINavigationController *_navigationController;
	BOOL                   _authentication;
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCAuthenticationScreenViewController new]];
	UIWindow               *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	window.rootViewController = nc;
	[window makeKeyAndVisible];
	_window = window;
	return YES;
}

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
	_authentication = YES;
	NSDictionary *parametrs = [NSDictionary dictionaryFromURLString:url.absoluteString];
	NSURL        *tokenURL  = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/login/oauth/access_token"
			                                                                          @"?client_id=dc665db234579172b3b8"
			                                                                          @"&client_secret=fb76ebe1be54a5b1b37981af7dc4950b0b9af8df"
			                                                                          @"&code=%@"
			                                                                          @"&redirect_uri=gister://"
			                                                                          @"&state=1234", parametrs[@"code"]]];

	NSData       *tokenURLData   = [[NSData alloc] initWithContentsOfURL:tokenURL];
	NSString     *tokenURLString = [[NSString alloc] initWithData:tokenURLData encoding:NSNonLossyASCIIStringEncoding];
	NSDictionary *tokenParametrs = [NSDictionary dictionaryFromURLString:tokenURLString];
	NSAssert(tokenParametrs[@"access_token"], @"Authentication Failed");
	[[NSUserDefaults standardUserDefaults] setObject:tokenParametrs[@"access_token"] forKey:@"access_token"];

	UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:[TCMainUserProfileViewController new]];
	UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:[TCPublicGistsListViewController new]];

	UITabBarController *tabBarController = [UITabBarController new];
	[tabBarController setViewControllers:@[ nc1, nc2 ]];
	nc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"My profile" image:[UIImage imageNamed:@"github_logo_30pxl.png"] tag:1];
	nc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Recent gists" image:[UIImage imageNamed:@"recent_gists.png"] tag:2];
	NSLog(@"#### access_token=%@ ####", tokenParametrs[@"access_token"]);

	_window.rootViewController = tabBarController;
	[_window makeKeyAndVisible];

	return NO;
}
@end