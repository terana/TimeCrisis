//
// Created by Anastasia on 7/10/16.
//

#import "TCTmpViewWithHeaderController.h"
#import "NSObject+TCDoWith.h"
#import "TCMyPageHeaderView.h"
#import "KeepLayout/KeepLayout.h"
@implementation TCTmpViewWithHeaderController
{
}
- (void) loadView
{
	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor = [UIColor whiteColor];

		__unused TCMyPageHeaderView *headerView = [TCMyPageHeaderView tc_with:^(TCMyPageHeaderView *oo) {
		[o addSubview:oo];
			CGFloat inset;
		oo.keepTopMarginInset.equal = inset = [[NSUserDefaults standardUserDefaults] floatForKey:@"inset"];
		oo.keepHorizontalMarginInsets.equal = 0;
		oo.keepHeight.equal = 20;
	}];

	}];
}
@end