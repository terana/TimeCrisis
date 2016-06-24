//
// Created by Anastasia on 6/22/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCButton.h"
#import "UIView+TCTapAction.h"
#import "NSObject+TCDoWith.h"

@implementation TCButton
{
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.layer.cornerRadius = 5;

		__unused UILabel *titleLabel = _label = [UILabel tc_with:^(UILabel *o) {
			[self addSubview:o];
			o.keepInsets.equal = 0;
		}];
	}

	return self;
}

- (void) setTarget:(id)object withAction:(SEL)action
{
	self.tc_tapAction = ^(UIView *sender){
		[object performSelector:action withObject:sender];
	};
}


@end