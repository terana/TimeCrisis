//
// Created by Anastasia on 6/27/16.
//

#import "TCGistsListView.h"
#import "TCGistTableCell.h"

@implementation TCGistsListView
{
}
+ (NSDictionary *) cellIdentifiers
{
	return @{ @"Cell" : [TCGistTableCell class],
			@"NoGists" : [UITableViewCell class] };
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_data count] == 0 ? 1 : [_data count];
}

- (void) setData:(NSArray *)data
{
	_data = data;
	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([_data count] == 0)
	{
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoGists"];
		cell.textLabel.text = @"No gists";
		return cell;
	}
	TCGistTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.gist          = _data[indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100.f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[_delegate gistIsSelected:_data[indexPath.row]];
}
@end
