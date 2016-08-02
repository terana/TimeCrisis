//
// Created by Anastasia on 7/26/16.
//

#import "TCMainUsersGistsListViewController.h"
#import "TCOtherUsersGistListViewController.h"
#import "TCPresentationManager.h"

@interface TCOtherUsersGistsListViewController () <TCGistsListViewDelegate>
@end

@implementation TCOtherUsersGistsListViewController
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
		self.title = @"Gists";
	}
	return self;
}

- (void) setGists:(NSArray *)gists
{
	TCGistsListView *view = (TCGistsListView *) self.view;
	view.data = gists;
}

- (void) gistIsSelected:(TCGist *)gist
{
	[[TCPresentationManager shared] openOtheUserFilesOfGist:gist withSender:self];
}
@end