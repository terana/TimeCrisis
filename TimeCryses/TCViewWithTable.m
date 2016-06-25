//
// Created by Anastasia on 6/25/16.
//

#import "TCViewWithTable.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@interface TCViewWithTable (TableView) <UITableViewDelegate, UITableViewDataSource>
@end

@implementation TCViewWithTable
{
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused UITableView *table = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] tc_with:^(UITableView *o) {
			o.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
			[self addSubview: o];
			o.keepHorizontalInsets.equal = 0;
			o.keepTopInset.equal = 15;
			o.keepBottomInset.equal = 0;
			o.delegate =  self;
			o.dataSource = self;
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

-(void) setData:(NSArray *)data
{
	_data = data;
	UITableView *tableview = [[self subviews] objectAtIndex:0];
	[tableview reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:identifier];
	}
	if(indexPath.section)
	{cell.textLabel.text = [NSString stringWithFormat:@"%@", _data[indexPath.row]];}
	else
	{
		cell.textLabel.text = @"Table";
	}
	return cell;
}

@end