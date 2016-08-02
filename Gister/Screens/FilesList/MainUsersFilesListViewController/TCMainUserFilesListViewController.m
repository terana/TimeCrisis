//
// Created by Anastasia on 6/29/16.
//

#import "TCMainUserFilesListViewController.h"
#import "TCFilesListView.h"
#import "TCMainUserFileContentViewController.h"
#import "TCPresentationManager.h"
#import "TCServerManager.h"

@interface TCMainUserFilesListViewController () <TCFilesListViewDelegate>
@end

@implementation TCMainUserFilesListViewController
{
}

+ (Class) viewClass
{
	return [TCFilesListView class];
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Files";

		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFile)];
	}
	return self;
}

- (void) addNewFile
{
	TCFile *file = [TCFile new];
	_gist.files  = [_gist.files arrayByAddingObject:file];
	file.gist    = _gist;
	file.changed = YES;

	[[TCPresentationManager shared] openNewFile:file withSender:self];
}


- (void) fileIsSelected:(TCFile *)file
{
	[[TCServerManager shared] getFileContentForFile:file withCallback:^(NSString *content, NSError *error) {
		file.content = content;
		[[TCPresentationManager shared] openMainUserContentOfFile:file withSender:self];
	}];
}

- (void) setGist:(TCGist *)gist
{
	_gist = gist;
	TCFilesListView *view = (TCFilesListView *) self.view;
	view.files = _gist.files;
}
@end