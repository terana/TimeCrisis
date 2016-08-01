//
// Created by Anastasia on 6/20/16.
//

#import "TCAppDelegate.h"
#import "TCPresentationManager.h"
#import "TCServerManager.h"

@implementation TCAppDelegate
{
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[TCPresentationManager shared] openInitialView];
	return YES;
}

@end