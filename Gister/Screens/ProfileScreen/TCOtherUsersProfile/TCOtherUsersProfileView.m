//
// Created by Anastasia on 7/26/16.
//

#import "TCOtherUsersProfileView.h"
#import "TCGeneralProfileInfoView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@implementation TCOtherUsersProfileView
{
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
@end