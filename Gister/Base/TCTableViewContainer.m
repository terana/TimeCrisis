//
// Created by Anastasia on 7/12/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCTableViewContainer.h"
#import "NSObject+TCDoWith.h"

@implementation TCTableViewContainer
{
}

+ (Class) tableViewClass
{
	return [UITableView class];
}

+ (UITableViewStyle) tableViewStyle
{
	return UITableViewStylePlain;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		__unused UITableView *tableView = _tableView = [[(UITableView *) [[[self class] tableViewClass] alloc] initWithFrame:CGRectZero style:[[self class] tableViewStyle]] tc_with:^(UITableView *o) {
			o.delegate   = self;
			o.dataSource = self;
			[self addSubview:o];
			o.keepInsets.equal = 0;

			NSDictionary  *reuseCells = [[self class] cellIdentifiers];
			for (NSString *identifier in reuseCells)
			{
				[o registerClass:reuseCells[identifier] forCellReuseIdentifier:identifier];
			}
		}];
	}
	return self;
}


+ (NSDictionary *) cellIdentifiers
{
	return nil;
}

- (void) setLayoutMargins:(UIEdgeInsets)layoutMargins
{
	[super setLayoutMargins:layoutMargins];

	UIEdgeInsets topandBottom = UIEdgeInsetsMake(layoutMargins.top, 0, layoutMargins.bottom, 0);
	_tableView.contentInset          = topandBottom;
	_tableView.scrollIndicatorInsets = topandBottom;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSAssert(0, @"Implement this method in the subclass");
	return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSAssert(0, @"Implement this method in the subclass");
	return nil;
}
@end