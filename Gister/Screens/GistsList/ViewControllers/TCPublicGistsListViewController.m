//
// Created by Anastasia on 6/27/16.
//

#import "TCPublicGistsListViewController.h"
#import "TCMainUserFilesListViewController.h"
#import "TCServerManager.h"
#import "TCPresentationManager.h"

@interface TCPublicGistsListViewController () <TCGistsListViewDelegate>
@end

@implementation TCPublicGistsListViewController
{
}

+ (Class) viewClass
{
	return [TCGistsListView class];
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.title = @"Recent gists";
	}
	return self;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[TCServerManager shared] getPublicGistsWithCallback:^(NSArray *gists, NSError *error) {
		TCGistsListView *view = (TCGistsListView *) self.view;
		view.data = gists;
	}];
}

- (void) gistIsSelected:(TCGist *)gist
{
	[[TCPresentationManager shared] openOtheUserFilesOfGist:gist withSender:self];
}
@end