//
// Created by Anastasia on 6/25/16.
//

#import "TCViewWithTable.h"

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
		self.userInteractionEnabled        = YES;
		UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drag:)];
		[self addGestureRecognizer:recognizer];
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
	return 2;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:identifier];
	}

		cell.textLabel.text = [NSString stringWithFormat:@"Section %d, row %d", indexPath.section, indexPath.row];
	return cell;
}
@end