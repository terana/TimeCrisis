//
// Created by Anastasia on 7/29/16.
//

#import "TCPresentationManager.h"
#import "TCServerManager.h"
#import "TCWelcomeScreenViewController.h"
#import "TCGithubAuthenticationViewController.h"
#import "TCMainUserProfileViewController.h"
#import "TCPublicGistsListViewController.h"
#import "TCMainUsersGistsListViewController.h"
#import "TCUsersListViewController.h"
#import "TCOtherUsersGistListViewController.h"
#import "TCCreatingGistViewController.h"
#import "TCMainUserFilesListViewController.h"
#import "TCPublicFilesListViewController.h"
#import "TCMainUserFileContentViewController.h"
#import "TCPublicFileContentViewController.h"

@interface TCPresentationManager () <TCServerManagerDelegate>
@end;

@implementation TCPresentationManager
{
	UIWindow           *_window;
	UITabBarController *_tabBarController;
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

#pragma mark - Opening initial views

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
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
	_window.rootViewController = navigationController;
	[_window makeKeyAndVisible];
}

- (void) openAuthenticationWebViewWithSender:(TCViewController *)sender callback:(BOOL (^)(NSURLRequest *))callback;
{
	TCGithubAuthenticationViewController *vc = [TCGithubAuthenticationViewController new];
	vc.callback                                 = callback;
	vc.navigationController.navigationBarHidden = YES;
	vc.hidesBottomBarWhenPushed                 = YES;
	[sender.navigationController setViewControllers:@[ vc ]];
}

#pragma mark - Opening screens for main user

- (void) openMainUserGistsWithSender:(TCViewController *)sender
{
	TCMainUsersGistsListViewController *vc = [TCMainUsersGistsListViewController new];
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openStarredGists:(NSArray *)gists withSender:(TCViewController *)sender
{
	TCOtherUsersGistsListViewController *vc = [TCOtherUsersGistsListViewController new];
	vc.title = @"Starred gists";
	vc.gists = gists;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openMainUserFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender
{
	TCMainUserFilesListViewController *vc = [TCMainUserFilesListViewController new];
	vc.gist = gist;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openMainUserContentOfFile:(TCFile *)file withSender:(TCViewController *)sender
{
	TCMainUserFileContentViewController *vc = [TCMainUserFileContentViewController new];
	vc.file                     = file;
	vc.hidesBottomBarWhenPushed = YES;
	[sender.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Opening screens for other users

- (void) openFollowers:(NSArray *)followers withSender:(TCViewController *)sender
{
	TCUsersListViewController *vc = [TCUsersListViewController new];
	vc.title = @"Followers";
	vc.users = followers;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openFollowing:(NSArray *)following withSender:(TCViewController *)sender
{
	TCUsersListViewController *vc = [TCUsersListViewController new];
	vc.title = @"Following";
	vc.users = following;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openOtherUserGists:(NSArray *)gists withSender:(TCViewController *)sender
{
	TCOtherUsersGistsListViewController *vc = [TCOtherUsersGistsListViewController new];
	vc.gists = gists;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openOtheUserFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender
{
	TCPublicFilesListViewController *vc = [TCPublicFilesListViewController new];
	vc.gist = gist;
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) openOtherUserContentOfFile:(TCFile *)file withSender:(TCViewController *)sender
{
	TCPublicFileContentViewController *vc = [TCPublicFileContentViewController new];
	vc.file                     = file;
	vc.hidesBottomBarWhenPushed = YES;
	[sender.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Managing gists

- (void) openNewGistScreenWithSender:(TCViewController *)sender
{
	TCCreatingGistViewController *vc = [TCCreatingGistViewController new];
	[sender.navigationController pushViewController:vc animated:YES];
}

- (void) returnToFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender
{
	NSArray *viewControllers = sender.navigationController.viewControllers;
	NSUInteger index = [viewControllers indexOfObject:sender];
	TCMainUserFilesListViewController *vc = viewControllers[index - 1];
	vc.gist = gist;
	[sender.navigationController popViewControllerAnimated:YES];
}

- (void) openNewFile:(TCFile *)file withSender:(TCViewController *)sender
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Creating new file"
	                                                               message:@"Write the name of new file"
	                                                        preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *creatingFile = [UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault
	                                                     handler:^(UIAlertAction *action) {
		                                                     UITextField *fileNameTextField = [alert textFields][0];
		                                                     file.filename = fileNameTextField.text;
		                                                     [self openMainUserContentOfFile:file withSender:sender];
	                                                     }];

	UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

	[alert addAction:creatingFile];
	[alert addAction:cancel];

	[alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
	}];
	[sender presentViewController:alert animated:YES completion:nil];
}

- (void) openRenamingOfFile:(TCFile *)file withSender:(TCViewController *)sender
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rename file"
	                                                               message:@""
	                                                        preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *renameAction = [UIAlertAction actionWithTitle:@"Rename" style:UIAlertActionStyleDefault
	                                                     handler:^(UIAlertAction *action) {
		                                                     UITextField *nameTextField = [alert textFields][0];
		                                                     file.changedName = nameTextField.text;
		                                                     file.changed     = YES;
		                                                     [[TCServerManager shared] editGist:file.gist withCallback:^(TCGist *gist, NSError *error) { //TODO do block in sender
			                                                     if (error == nil)
			                                                     {
				                                                     file.gist                             = gist;
				                                                     [self returnToFilesOfGist:gist withSender:sender];
			                                                     }
			                                                     else
			                                                     {
				                                                     [self showMessageWithError:error sender:sender callback:nil];
			                                                     }
		                                                     }];
	                                                     }];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	[alert addAction: cancelAction];
	[alert addAction:renameAction];
	[alert setPreferredAction:renameAction];

	[alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
		textField.placeholder = @"New name";
	}];
	[sender presentViewController:alert animated:YES completion:nil];
}

#pragma mark - TCServerManagerDelegate

- (void) serverManager:(TCServerManager *)serverManager foundExpiredToken:(NSString *)expiredToken
{
	UINavigationController *navigationController = [UINavigationController new];
	[navigationController setViewControllers:@[ [TCGithubAuthenticationViewController new] ]];
	[_window setRootViewController:navigationController];
}

#pragma  mark - Handling errors

- (void) showMessageWithError:(NSError *)error sender:(TCViewController *)sender callback:(void (^)())callback
{
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		callback ? callback() : nil; //TODO
	}]];
	[sender presentViewController:alertController animated:YES completion:nil];
}
@end