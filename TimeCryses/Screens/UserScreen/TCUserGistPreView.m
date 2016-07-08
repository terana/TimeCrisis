//
// Created by Anastasia on 7/7/16.
//

#import "TCUserGistPreView.h"
#import "NSObject+TCDoWith.h"
#import "KeepLayout/KeepLayout.h"
#import "TCGist.h"
#import "TCFile.h"

@interface TCUserGistPreView () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation TCUserGistPreView
{
	UITableView *_tableView;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor whiteColor];
		__unused UITableView *tableView = _tableView = [UITableView tc_with:^(UITableView *o) {
			o.backgroundColor = [UIColor whiteColor];
			o.dataSource      = self;
			o.delegate        = self;
			[o registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
			[self addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}
	return self;
}

- (void) setGistsArray:(NSArray *)gistsArray
{
	_gistsArray = gistsArray;
	[_tableView reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if(section == 0)
	{
		return 1;
	}
	return _gistsArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.textLabel.text = @"";
	if(indexPath.section ==0)
	{
		cell.textLabel.text = @"Recent gists:";
		cell.accessoryType = UITableViewCellAccessoryNone;
		return cell;
	}
	TCGist *gist = _gistsArray[indexPath.row];
	TCFile *file = gist.files[0];
	cell.textLabel.text = file.filename;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

@end