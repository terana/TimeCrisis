//
// Created by Anastasia on 6/29/16.
//

#import "TCTableWithGistFilesViewController.h"
#import "TCViewWithGistFiles.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithFileContentController.h"

@interface TCTableWithGistFilesViewController () <TCFileSelected>
@end

@implementation TCTableWithGistFilesViewController
{
}
- (void) loadView
{
	self.title = @"Files";
	self.view  = [TCViewWithGistFiles tc_with:^(TCViewWithGistFiles *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	TCViewWithGistFiles *view = self.view;
	view.gist     = _gist;
	view.delegate = self;
}

- (void) fileIsSelected:(TCFile *)file
{
	TCViewWithFileContentController *vc = [TCViewWithFileContentController new];
	vc.file = file;
	[self.navigationController pushViewController:vc animated:YES];
}
@end