//
// Created by Anastasia on 7/29/16.
//

#import "TCPresentationManager.h"
#import "TCServerManager.h"
#import "TCWelcomeScreenViewController.h"
#import "TCGithubAuthenticationViewController.h"
#import "TCMainUserProfileViewController.h"
#import "TCPublicGistsListViewController.h"

@interface TCPresentationManager () <TCServerManagerDelegate>
@end;

@implementation TCPresentationManager
{
	UIWindow               *_window;
	UINavigationController *_navigationController;
	UITabBarController     *_tabBarController;
}
+ (instancetype) shared
{
	static TCPresentationManager *staticInstance = nil;
	static dispatch_once_t       once;
	dispatch_once(&once, ^{
		staticInstance = [self new];
	});
	return staticInstance;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	}
	return self;
}

- (void) openInitialView
{
	if ([[TCServerManager shared] foundAccessToken])
	{
		[self openMainView];
		return;
	}
	[self openWelcomeView];
}

- (void) openMainView
{
	UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:[TCMainUserProfileViewController new]];
	UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:[TCPublicGistsListViewController new]];


	UITabBarController *tabBarController = [UITabBarController new];
	[tabBarController setViewControllers:@[ nc1, nc2 ]];
	nc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"My profile" image:[UIImage imageNamed:@"github_logo_30pxl.png"] tag:1];
	nc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Recent gists" image:[UIImage imageNamed:@"recent_gists.png"] tag:2];
	_tabBarController = tabBarController;

	_window.rootViewController = tabBarController;
	[_window makeKeyAndVisible];
}

- (void) openWelcomeView
{
	TCWelcomeScreenViewController *vc = [TCWelcomeScreenViewController new];
	vc.navigationController.navigationBarHidden = YES;
	vc.hidesBottomBarWhenPushed                 = YES;
	_navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
	_window.rootViewController = _navigationController;
	[_window makeKeyAndVisible];
}

- (void) openAuthenticationWebViewWithSender:(TCViewController *)sender callback:(BOOL (^)(NSURLRequest *))callback;
{
	TCGithubAuthenticationViewController *vc = [TCGithubAuthenticationViewController new];
	vc.callback = callback;
	vc.navigationController.navigationBarHidden = YES;
	vc.hidesBottomBarWhenPushed                 = YES;
	[sender.navigationController setViewControllers:@[ vc ]];
}


- (void) serverManager:(TCServerManager *)serverManager foundExpiredToken:(NSString *)expiredToken
{
	[_navigationController setViewControllers:@[ [TCGithubAuthenticationViewController new] ]];
}

- (void) showMessageWithError:(NSError *)error sender:(TCViewController *)sender callback:(void (^)())callback
{
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertActionStyleDefault];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		callback();
	}]];
	[sender presentViewController:alertController animated:YES completion:nil];
}
@end