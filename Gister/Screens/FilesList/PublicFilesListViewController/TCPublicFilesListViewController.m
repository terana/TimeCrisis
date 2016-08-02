//
// Created by Anastasia on 7/25/16.
//

#import "TCPublicFilesListViewController.h"
#import "TCGist.h"
#import "TCFilesListView.h"
#import "TCPublicFileContentViewController.h"
#import "TCPresentationManager.h"

@interface TCPublicFilesListViewController () <TCFilesListViewDelegate>
@end

@implementation TCPublicFilesListViewController
{
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Files";
	}
	return self;
}

+ (Class) viewClass
{
	return [TCFilesListView class];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	TCFilesListView *view = (TCFilesListView *) self.view;
	view.files = _gist.files;
}

- (void) fileIsSelected:(TCFile *)file
{
	[[TCPresentationManager shared] openOtherUserContentOfFile:file withSender:self];
}
@end