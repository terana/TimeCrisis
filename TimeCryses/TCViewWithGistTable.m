//
// Created by Anastasia on 6/27/16.
//

#import "TCViewWithGistTable.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "TCGistTableCell.h"

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
	if (indexPath.section)
	{
		TCGistTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
		cell.gist = _data[indexPath.row];
		return cell;
	}
	else
	{
		UITableViewCell *cell = [UITableViewCell new];
		cell.textLabel.text = @"Table";
		return cell;
	}
	return nil;
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
