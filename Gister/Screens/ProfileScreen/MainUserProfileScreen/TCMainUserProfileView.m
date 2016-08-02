//
// Created by Anastasia on 7/12/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMainUserProfileView.h"
#import "TCUser.h"
#import "TCGeneralProfileInfoTableCell.h"

@implementation TCMainUserProfileView
{
}
+ (UITableViewStyle) tableViewStyle
{
	return UITableViewStyleGrouped;
}

+ (NSDictionary *) cellIdentifiers
{
	return @{ @"PlainCell" : [UITableViewCell class],
			@"CellWithUserInfo" : [TCGeneralProfileInfoTableCell class] };
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
	UITableViewCell *cell;

	switch (indexPath.section)
	{
		case 0:
		{
			cell = [tableView dequeueReusableCellWithIdentifier:@"CellWithUserInfo"];
			TCGeneralProfileInfoTableCell *infoCell = (TCGeneralProfileInfoTableCell *) cell;
			infoCell.user = _user;
			break;
		}
		case 1:
		{

			switch (indexPath.row)
			{
				case 0:
				{
					cell = [tableView dequeueReusableCellWithIdentifier:@"PlainCell"];
					cell.textLabel.text = [NSString stringWithFormat:@"%d Gists", [_user.publicGists unsignedIntegerValue] + [_user.privateGists unsignedIntegerValue]];
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 1:
				{
					cell = [tableView dequeueReusableCellWithIdentifier:@"PlainCell"];
					cell.textLabel.text = [NSString stringWithFormat:@"%d Followers", [_user.followers unsignedIntegerValue]];
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 2:
				{
					cell = [tableView dequeueReusableCellWithIdentifier:@"PlainCell"];
					cell.textLabel.text = [NSString stringWithFormat:@"%d Following", [_user.following unsignedIntegerValue]];
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 3:
				{
					cell = [tableView dequeueReusableCellWithIdentifier:@"PlainCell"];
					cell.textLabel.text = @"Starred gists";
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				default:
					break;
			}
			break;
		}
		case 2:
		{
			cell = [tableView dequeueReusableCellWithIdentifier:@"PlainCell"];
			cell.accessoryType  = UITableViewCellAccessoryNone;
			cell.textLabel.text = @"Sign out";
		}
		default:
			break;
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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