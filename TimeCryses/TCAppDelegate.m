//
// Created by Anastasia on 6/20/16.
//

#import "TCAppDelegate.h"
#import "TCMainMenuViewController.h"
#import "TCTableWithGistsViewController.h"

@implementation TCAppDelegate
{
	__strong UIWindow *_window;
}

- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UIWindow               *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	UINavigationController *nc     = [[UINavigationController alloc] initWithRootViewController:[TCMainMenuViewController new]];
	[nc setNavigationBarHidden:NO animated:YES];
	window.rootViewController = nc;
	[window makeKeyAndVisible];
	_window = window;
	return YES;
}
@end