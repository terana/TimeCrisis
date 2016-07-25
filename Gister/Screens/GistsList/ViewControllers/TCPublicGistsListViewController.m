//
// Created by Anastasia on 6/27/16.
//

#import "TCPublicGistsListViewController.h"
#import "TCGistsListView.h"
#import "TCFilesListViewController.h"
#import "TCServerManager.h"

@implementation TCPublicGistsListViewController
{
}

+ (Class) viewClass
{
	return [TCGistsListView class];
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[TCServerManager shared] getPublicGistsWithCallback:^(NSArray *gists, NSError *error) {
	 	TCGistsListView *view = self.view;
		view.data = gists;
	}];
}

- (void) gistIsSelected:(TCGist *)gist
{
	TCFilesListViewController *vc = [TCFilesListViewController new];
	vc.gist = gist;
	[self.navigationController pushViewController:vc animated:YES];
}
@end