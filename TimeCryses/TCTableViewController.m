//
// Created by Anastasia on 6/24/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCTableViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithTable.h"

@implementation TCTableViewController
{
}
- (void) loadView
{
	self.view = [TCViewWithTable tc_with:^(TCViewWithTable *o) {
		o.backgroundColor = [UIColor whiteColor];
		__unused UITableView *table = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] tc_with:^(UITableView *oo) {
			oo.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
			[o addSubview: oo];
			oo.keepHorizontalInsets.equal = 0;
			oo.keepVerticalInsets.equal = 5;
			oo.delegate = (TCViewWithTable *) o;
			oo.dataSource = (TCViewWithTable *) o;

		}];

	}];
}

- (void) updateOnClassInjection
{
	[self loadView];
}


@end