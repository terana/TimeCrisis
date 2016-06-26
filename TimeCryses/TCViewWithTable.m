//
// Created by Anastasia on 6/25/16.
//

#import "TCViewWithTable.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCUserTableCell.h"

@interface TCViewWithTable (TableView) <UITableViewDelegate, UITableViewDataSource>
@end

@implementation TCViewWithTable
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
			[o registerClass:[TCUserTableCell class] forCellReuseIdentifier:@"Cell"];
			[self addSubview:o];
			o.keepHorizontalInsets.equal = 0;
			o.keepTopInset.equal         = 15;
			o.keepBottomInset.equal      = 0;
		}];
	}
	return self;
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
	return [_data count];
}

- (void) setData:(NSArray *)data
{
	_data = data;
	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TCUserTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (indexPath.section)
	{
		cell.user = _data[indexPath.row];
	}
	else
	{
		cell.textLabel.text = @"Table";
	}
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section)
	{
		return 100.f;
	}
	return 20.f;
}
@end