//
// Created by Anastasia on 7/7/16.
//

#import "TCUserInformationTableView.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"
#import "NSDate+TCDateString.h"
#import "UIScrollView+scrollingEnabled.h"
#import "TCUserInformatiobSelection.h"

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
			o.backgroundColor     = [UIColor whiteColor];
			o.delegate            = self;
			o.dataSource          = self;
			o.tc_scrollingEnabled = NO;
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

	[_tableView reloadData];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
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
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
		default:
			break;
	}
	return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row)
	{
		case 0:
		{
			[_delegate openGitHubPage:_user.gitURL];
			break;
		}
		case 2:
		{
			[_delegate openFollowers:_user.followersURL];
			break;
		}
		case 3:
		{
			[_delegate openFollowings:_user.followingsURL];
			break;
		}
		default:
		{
			break;
		}
	}
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 25.f;
}
@end