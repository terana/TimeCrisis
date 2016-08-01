//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileView.h"
#import "TCGeneralProfileInfoView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCUser.h"
#import "TCGeneralProfileInfoTableCell.h"

@implementation TCOtherUsersProfileView
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
	return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0)
	{
		return 1;
	}
	return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell;

	switch (indexPath.section)
	{
		case 0:
		{
			cell = [tableView dequeueReusableCellWithIdentifier:@"CellWithUserInfo"];
			TCGeneralProfileInfoTableCell *infoCell = (TCGeneralProfileInfoTableCell *)cell;
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
					cell.textLabel.text = [NSString stringWithFormat:@"%d Gists", [_user.publicGists unsignedIntegerValue]];
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
				default:
				{
					break;
				}
			}
			break;
		}
		default:
			break;
	}
	return cell;
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
				default:
					break;
			}
			break;
		}
		default:
			break;
	}
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0)
	{
		return 100.f;
	}
	return 40.f;
}

- (void) setUser:(TCUser *)user
{
	_user = user;
	[_tableView reloadData];
}
@end