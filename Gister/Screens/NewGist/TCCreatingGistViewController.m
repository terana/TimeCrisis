//
// Created by Anastasia on 7/27/16.
//

#import "TCCreatingGistViewController.h"
#import "TCServerManager.h"
#import "TCPresentationManager.h"

@interface TCCreatingGistViewController () <TCCreatingGistViewDelegate>
@end

@implementation TCCreatingGistViewController
{
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"New gist";
	}
	return self;
}

- (void) createGist:(TCGist *)gist
{
	[[TCServerManager shared] createGist:gist callback:^(TCGist *gist1, NSError *error) {
		if (error == nil)
		{
			[[TCPresentationManager shared] openMainUserGistsWithSender:self];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end