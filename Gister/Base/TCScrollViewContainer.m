//
// Created by Anastasia on 7/24/16.
//

#import "TCScrollViewContainer.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@implementation TCScrollViewContainer
{
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.preservesSuperviewLayoutMargins = YES;

		__unused UIScrollView *scrollView = _scrollView = [UIScrollView tc_with:^(__weak UIScrollView *o) {
			o.preservesSuperviewLayoutMargins = YES;
			o.delegate                        = self;
			[self addSubview:o];
			o.keepInsets.equal = 0;

			__unused UIView *contentView = _contentView = [UIView tc_with:^(__weak UIView *oo) {
				oo.preservesSuperviewLayoutMargins = YES;
				[o addSubview:oo];
				oo.keepWidthTo(o).equal = 1;
				oo.keepInsets.equal     = 0;
			}];
		}];
	}
	return self;
}

- (void) setLayoutMargins:(UIEdgeInsets)layoutMargins
{
	[super setLayoutMargins:layoutMargins];

	UIEdgeInsets topAndBottom = UIEdgeInsetsMake(layoutMargins.top, 0, layoutMargins.bottom, 0);
	_scrollView.contentInset          = topAndBottom;
	_scrollView.scrollIndicatorInsets = topAndBottom;
}
@end