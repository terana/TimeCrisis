//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileView.h"
#import "TCGeneralProfileInfoView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCProfileViewDelegate.h"
#import "TCUser.h"

@implementation TCOtherUsersProfileView
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
					cell.textLabel.text = [NSString stringWithFormat:@"%d Gists",[_user.publicGists unsignedIntegerValue]];
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 1:
				{
					cell.textLabel.text = [NSString stringWithFormat:@"%d Followers", [_user.followers unsignedIntegerValue]];
					cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
					break;
				}
				case 2:
				{
					cell.textLabel.text = [NSString stringWithFormat:@"%d Following", [_user.following unsignedIntegerValue]];
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
		default: break;
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