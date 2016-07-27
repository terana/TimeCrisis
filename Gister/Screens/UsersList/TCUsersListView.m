//
// Created by Anastasia on 7/26/16.
//

#import "TCUsersListView.h"
#import "TCUserTableCell.h"
#import "TCUsersListViewDelegate.h"

@implementation TCUsersListView
{
}
+ (NSDictionary *) cellIdentifiers
{
	return @{ @"Cell" : [TCUserTableCell class] };
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_users count];
}

- (void) setUsers:(NSArray *)users
{
	_users = users;
	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TCUserTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.user          = _users[indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[_delegate openProfileOfUser:_users[indexPath.row]];
}
@end