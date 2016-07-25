//
// Created by Anastasia on 7/26/16.
//

#import "TCTextViewContainer.h"
#import "KeepLayout/KeepLayout.h"
#import "NSObject+TCDoWith.h"

@implementation TCTextViewContainer
{
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.preservesSuperviewLayoutMargins = YES;

		__unused UITextView *textView = _textView = [UITextView tc_with:^(__weak UITextView *o) {
			o.preservesSuperviewLayoutMargins = YES;
			o.delegate = self;
			[self addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}
	return self;
}

- (void) setLayoutMargins:(UIEdgeInsets)layoutMargins
{
	[super setLayoutMargins:layoutMargins];

	UIEdgeInsets topAndBottom = UIEdgeInsetsMake(layoutMargins.top, 0, layoutMargins.bottom, 0);
	_textView.contentInset          = topAndBottom;
	_textView.scrollIndicatorInsets = topAndBottom;
}
@end