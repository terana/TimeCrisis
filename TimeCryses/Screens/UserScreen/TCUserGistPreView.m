//
// Created by Anastasia on 7/7/16.
//

#import "TCUserGistPreView.h"
#import "NSObject+TCDoWith.h"
#import "KeepLayout/KeepLayout.h"
#import "TCFile.h"
#import "UIView+TCTapAction.h"

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

		__unused UILabel *recentGistsLabel = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
			o.text = @"   Recent gists:";
			[o setTarget:_delegate withAction:@selector(openGistsList:)];
			[self addSubview:o];
			o.keepTopInset.equal = 0;
			o.keepHeight.equal = 25;
			o.keepHorizontalInsets.equal = 0;
		}];

		__unused UITableView *tableView = _tableView = [UITableView tc_with:^(UITableView *o) {
			o.backgroundColor = [UIColor whiteColor];
			o.dataSource      = self;
			o.delegate        = self;
			[o registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
			[self addSubview:o];
			o.keepTopOffsetTo(recentGistsLabel).equal = 0;
			o.keepBottomInset.equal = 0;
			o.keepHorizontalInsets.equal = 0;
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
	return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _gistsArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	TCGist *gist = _gistsArray[indexPath.row];
	TCFile *file = gist.files[0];
	cell.textLabel.text = file.filename;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[_delegate openGist:_gistsArray[indexPath.row]];
}

@end