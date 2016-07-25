//
// Created by Anastasia on 6/29/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCFilesListView.h"
#import "NSObject+TCDoWith.h"

@interface TCFilesListView ()
@end

@implementation TCFilesListView
+ (NSDictionary *) cellIdentifiers
{
	return @{ @"Cell" : [UITableViewCell class] };
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _gist.files.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	TCFile          *file = _gist.files[indexPath.row];
	cell.textLabel.text = file.filename;
	cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void) setGist:(TCGist *)gist
{
	_gist = gist;
	[_tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.delegate fileIsSelected:_gist.files[indexPath.row]];
}
@end