//
// Created by Anastasia on 6/29/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCFilesListView.h"
#import "TCFile.h"

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
	return _files.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	TCFile          *file = _files[(NSUInteger) indexPath.row];
	cell.textLabel.text = file.filename;
	cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void) setFiles:(NSArray *)files
{
	_files = files;
	[_tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.delegate fileIsSelected:_files[(NSUInteger) indexPath.row]];
}
@end