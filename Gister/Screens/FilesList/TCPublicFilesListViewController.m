//
// Created by Anastasia on 7/25/16.
//

#import "TCPublicFilesListViewController.h"
#import "TCGist.h"
#import "TCFilesListView.h"
#import "TCPublicFileContentViewController.h"

@implementation TCPublicFilesListViewController
{
}

+ (Class) viewClass
{
	return [TCFilesListView class];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	TCFilesListView *view = self.view;
	view.gist = _gist;
}

- (void) fileIsSelected:(TCFile *)file
{
	TCPublicFileContentViewController *vc = [TCPublicFileContentViewController new];
	vc.file                     = file;
	vc.hidesBottomBarWhenPushed = YES;// HOW to hide tab bar?
	[self.navigationController pushViewController:vc animated:YES];
}


@end