//
// Created by Anastasia on 6/27/16.
//

#import "TCViewWithGistTable.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCGistTableCell.h"
#import "TCGistSelected.h"

@interface TCViewWithGistTable (UITableViewProtocols) <UITableViewDelegate, UITableViewDataSource>
@end

@implementation TCViewWithGistTable
{
	UITableView *_tableView;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused UITableView *table = _tableView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] tc_with:^(UITableView *o) {
			o.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
			o.delegate        = self;
			o.dataSource      = self;
			[o registerClass:[TCGistTableCell class] forCellReuseIdentifier:@"Cell"];
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
	return [_data count];
}

- (void) setData:(NSArray *)data
{
	_data = data;
	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TCGistTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.gist = _data[indexPath.row];
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
