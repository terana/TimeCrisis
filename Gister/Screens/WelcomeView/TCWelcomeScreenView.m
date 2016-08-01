//
// Created by Anastasia on 7/14/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCWelcomeScreenView.h"
#import "TCButton.h"
#import "UIView+TCTapAction.h"
#import "NSObject+TCDoWith.h"

@implementation TCWelcomeScreenView
{
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor whiteColor];
		__unused TCButton *signIn = [TCButton tc_with:^(TCButton *o) {
			o.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
			o.label.text      = @" Sign in ";
			[o setTarget:self withAction:@selector(signIn)];
			[self addSubview:o];
			o.keepCenter.equal = 0.5;
		}];
	}
	return self;
}

- (void) signIn
{
	[_delegate signIn];
}
@end