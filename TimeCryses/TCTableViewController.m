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
	}];
}

- (void) viewDidLoad
{
	NSArray *data = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12 ];
	TCViewWithTable *view = self.view;
	view.data = data;
}

- (void) updateOnClassInjection
{
	[self loadView];
}

@end