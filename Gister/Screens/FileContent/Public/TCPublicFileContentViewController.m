//
// Created by Anastasia on 7/23/16.
//

#import "TCPublicFileContentViewController.h"
#import "TCUserFileContentView.h"
#import "TCServerManager.h"
#import "TCPublicFileContentView.h"
#import "UIViewController+ShowError.h"

@implementation TCPublicFileContentViewController
{
}
- (void) viewWillAppear:(BOOL)animated
{
	[self reloadInputViews];
	[super viewWillAppear:animated];
	[[TCServerManager shared] getFileContentForFile:_file withCallback:^(NSString *content, NSError *error) {
		if (!error)
		{
			TCPublicFileContentView *view = self.view;
			view.fileContent = content;
			[self reloadInputViews];
		}
		else
		{
			[self showMessageWithError:error callback:^{
				[[self navigationController] popViewControllerAnimated:YES];
			}];
		}
	}];

	[[[self tabBarController] tabBar] setHidden:YES]; //WHY it doesn't work?
}
@end