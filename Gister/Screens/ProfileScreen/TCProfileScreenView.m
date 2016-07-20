//
// Created by Anastasia on 7/12/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCProfileScreenView.h"
#import "TCGeneralProfileInfoView.h"
#import "NSObject+TCDoWith.h"
#import "TCProfileScreenViewDelegate.h"

@implementation TCProfileScreenView
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
	return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0 || section == 2)
	{
		return 1;
	}
	return 4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

	switch (indexPath.section)
	{
		case 0:
		{
			__unused TCGeneralProfileInfoView *view = [TCGeneralProfileInfoView tc_with:^(TCGeneralProfileInfoView *o) {
				if (_user)
				{o.user = _user;}
				UIView *view = cell.contentView;
				[view addSubview:o];
				o.keepInsets.equal = 0;
			}];
			break;
		}
		case 1:
		{

			switch (indexPath.row)
			{
				case 0:
				{
					cell.textLabel.text = @"Gists";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 1:
				{
					cell.textLabel.text = @"Followers";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 2:
				{
					cell.textLabel.text = @"Following";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 3:
				{
					cell.textLabel.text = @"Starred";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				default:
				{
					cell.textLabel.text = @"";
					cell.accessoryType  = UITableViewCellAccessoryNone;
					break;
				}
			}
			break;
		}
		case 2:
		{
			cell.textLabel.text = @"Sign out";
		}
	}
	return cell;
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
		default: break;
	}
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	[_tableView reloadData];
}
@end