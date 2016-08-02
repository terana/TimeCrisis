//
// Created by Anastasia on 7/23/16.
//

#import "TCPublicFileContentViewController.h"
#import "TCServerManager.h"
#import "TCPresentationManager.h"
#import "TCFileContentView.h"
#import "TCPublicFileContentView.h"

@implementation TCPublicFileContentViewController
{
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[TCServerManager shared] getFileContentForFile:_file withCallback:^(NSString *content, NSError *error) {
		if (!error)
		{
			TCPublicFileContentView *view = (TCPublicFileContentView *) self.view;
			view.fileContent = content;
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end