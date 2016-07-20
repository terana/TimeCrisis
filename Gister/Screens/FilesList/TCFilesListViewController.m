//
// Created by Anastasia on 6/29/16.
//

#import "TCFilesListViewController.h"
#import "TCFilesListView.h"
#import "NSObject+TCDoWith.h"
#import "TCFileContentView.h"

@interface TCFilesListViewController () <TCFilesListViewDelegate>
@end

@implementation TCFilesListViewController
{
}

-(instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Files";

		self.navigationItem.rightBarButtonItem = [UIBarButtonItem tc_with:^(UIBarButtonItem *o){
			o.title = @"New file";
			o.action = @selector(createNewFile);
		}];
	}
	return self;
}

-(void) createNewFile
{

}
- (void) loadView
{
	self.view  = [TCFilesListView tc_with:^(TCFilesListView *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	TCFilesListView *view = self.view;
	view.gist     = _gist;
	view.delegate = self;
}

- (void) fileIsSelected:(TCFile *)file
{
	TCFileContentView *vc = [TCFileContentView new];
	vc.file = file;
	[self.navigationController pushViewController:vc animated:YES];
}
@end