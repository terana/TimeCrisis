//
// Created by Anastasia on 6/20/16.
//

#import "TCAppDelegate.h"
#import "TCMainMenuViewController.h"
#import "TCTableWithGistsViewController.h"
#import "NSDictionary+TCParseURL.h"
#import "TCAuthenticationViewController.h"

@implementation TCAppDelegate
{
	__strong UIWindow      *_window;
	UINavigationController *_navigationController;
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UIWindow               *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCAuthenticationViewController new]];
	[nc setNavigationBarHidden:NO animated:YES];
	window.rootViewController = _navigationController = nc;
	[window makeKeyAndVisible];
	_window = window;
	return YES;
}

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
	NSData       *urlData   = [[NSData alloc] initWithContentsOfURL:url];
	NSString     *urlString = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
	NSDictionary *parametrs = [NSDictionary dictionaryFromURLString:urlString];
	[_navigationController pushViewController:[TCMainMenuViewController new] animated:YES];
	return NO;
}
@end