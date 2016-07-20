//
// Created by Anastasia on 6/29/16.
//

#import <KeepLayout/KeepLayout.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCFilesListView.h"
#import "TCGist.h"
#import "NSObject+TCDoWith.h"
#import "TCFilesListViewDelegate.h"
#import "TCFile.h"

@interface TCFilesListView () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation TCFilesListView
{
	UITableView *_tableView;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused UITableView *tableView = _tableView = [UITableView tc_with:^(UITableView *o) {
			o.backgroundColor = [UIColor whiteColor];
			o.delegate        = self;
			o.dataSource      = self;
			[o registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
			[self addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}
	return self;
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
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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