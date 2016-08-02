//
// Created by Anastasia on 7/2/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMainUserFileContentViewController.h"
#import "TCServerManager.h"
#import "TCMainUserFileContentView.h"
#import "TCPresentationManager.h"

@interface TCMainUserFileContentViewController () <TCMainUserFileContentViewDelegate>
@end

@implementation TCMainUserFileContentViewController
{
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveFile)];
	}
	return self;
}

- (void) setFile:(TCFile *)file
{
	_file = file;
	self.title = _file.filename;
	TCMainUserFileContentView *view = (TCMainUserFileContentView *) self.view;
	view.fileContent = file.content;
}

- (void) renameFile
{
	[[TCPresentationManager shared] openRenamingOfFile:_file withSender:self];
}

- (void) saveFile
{
	TCMainUserFileContentView *view        = (TCMainUserFileContentView *) self.view;
	NSString                  *fileContent = view.textView.text;
	if (![fileContent isEqualToString:_file.content])
	{
		_file.changed = YES;
		_file.content = fileContent;

		[[TCServerManager shared] editGist:_file.gist withCallback:^(TCGist *gist, NSError *error) {
			if (error == nil)
			{
				_file.gist = gist;
				[[TCPresentationManager shared] returnToFilesOfGist:gist withSender:self];
			}
			else
			{
				[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
			}
		}];
	}
}

- (void) deleteFile
{
	_file.content = nil;
	_file.changed = YES;

	[[TCServerManager shared] editGist:_file.gist withCallback:^(TCGist *gist, NSError *error) {
		if (error == nil)
		{
			_file.gist = gist;
			[[TCPresentationManager shared] returnToFilesOfGist:gist withSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end