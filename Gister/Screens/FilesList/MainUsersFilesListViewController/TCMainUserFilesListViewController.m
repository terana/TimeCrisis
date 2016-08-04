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

		UIBarButtonItem *newItem    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFile)];
		UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteGist)];
		[self.navigationItem setRightBarButtonItems:@[ deleteItem, newItem ] animated:YES];
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

- (void) deleteGist
{
	[[TCPresentationManager shared] showGistRemovingAlertWithSender:self action:^{
		[[TCServerManager shared] deleteGist:_gist withCallback:^(NSError *error) {
			if (error == nil)
			{
				[[TCPresentationManager shared] openMainUserGistsWithSender:self];
			}
			else
			{
				[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
			}
		}];
	}];
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