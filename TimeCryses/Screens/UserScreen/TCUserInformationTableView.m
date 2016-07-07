//
// Created by Anastasia on 7/7/16.
//

#import "TCUserInformationTableView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"

@interface TCUserInformationTableView (TableView) <UITableViewDelegate, UITableViewDataSource>
@end

@implementation TCUserInformationTableView
{
	UITableView *_tableView;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused UITableView *table = _tableView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] tc_with:^(UITableView *o) {
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
	return 4;
}

- (void) setUser:(TCUser *)user
{
	_user = user;

	[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].textLabel.text = _user.login;
	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	switch (indexPath.row)
	{
		case 0:
		{
			cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
			cell.textLabel.text = _user.login;
			break;
		}
		case 1:
		{
			cell.textLabel.text = [NSString stringWithFormat:@"Joined on %@", [_user.registrationDate stringFromDate]];
			break;
		}
		case 2:
		{
			cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
			cell.textLabel.text = @"Followers";
			break;
		}
		case 3:
		{
			cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
			cell.textLabel.text = @"Followings";
			break;
		}
	}
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 20.f;
}
@end