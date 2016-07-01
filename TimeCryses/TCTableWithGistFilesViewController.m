//
// Created by Anastasia on 6/29/16.
//

#import "TCTableWithGistFilesViewController.h"
#import "TCViewWithGistFiles.h"
#import "NSObject+TCDoWith.h"
#import "TCGist.h"

@implementation TCTableWithGistFilesViewController
{
}
- (void) loadView
{
	self .title = @"Files";
	self.view = [TCViewWithGistFiles tc_with:^(TCViewWithGistFiles *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	TCViewWithGistFiles *view = self.view;
	view.gist = _gist;
}
@end