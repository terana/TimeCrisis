//
// Created by Anastasia on 7/26/16.
//

#import "TCUserProfileView.h"
#import "TCProfileViewDelegate.h"
#import "TCUser.h"

@implementation TCUserProfileView
{
}
+ (UITableViewStyle) tableViewStyle
{
	return UITableViewStyleGrouped;
}

+ (NSDictionary *) cellIdentifiers
{
	return @{ @"Cell" : [UITableViewCell class] };
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	NSAssert(0, @"Should be implemented in subclass");
	return 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSAssert(0, @"Should be implemented in subclass");
	return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSAssert(0, @"Should be implemented in subclass");
	return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0)
	{
		return 100.f;
	}
	return 40.f;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"#### selected row %d at section %d ####", indexPath.row, indexPath.section);
	switch (indexPath.section)
	{
		case 1:
		{

			switch (indexPath.row)
			{
				case 0:
				{
					[_delegate openGists];
					break;
				}
				case 1:
				{
					[_delegate openFollowers];
					break;
				}
				case 2:
				{
					[_delegate openFollowing];
					break;
				}
				case 3:
				{
					[_delegate openStarred];
					break;
				}
				default:
					break;
			}
			break;
		}
		case 2:
		{
			[_delegate signOut];
			break;
		}
		default:
			break;
	}
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	[_tableView reloadData];
}
@end