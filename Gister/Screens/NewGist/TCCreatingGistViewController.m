//
// Created by Anastasia on 7/27/16.
//

#import "TCCreatingGistViewController.h"
#import "TCServerManager.h"
#import "TCUsersFilesListViewController.h"
#import "UIViewController+ShowError.h"

@implementation TCCreatingGistViewController
{
}
- (void) createGist:(TCGist *)gist
{
	[[TCServerManager shared] createGist:gist callback:^(TCGist *gist1, NSError *error) {
		if (error == nil)
		{
			TCUsersFilesListViewController *vc = [TCUsersFilesListViewController new];
			vc.gist = gist1;
			[[self navigationController] pushViewController:vc animated:YES];
		}
		else
		{
			[self showMessageWithError:error callback:^{
			}];
		}
	}];
}
-(instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"New gist";
	}
	return self;
}
@end