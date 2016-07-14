//
// Created by Anastasia on 6/22/16.
//

#import <objc/runtime.h>
#import "UIView+TCTapAction.h"

@interface UIView ()
@property (nonatomic, strong) UITapGestureRecognizer *tc_tapGestureRecognizer;
@end

@implementation UIView (TCTapAction)
- (TCTapActionBlock) tc_tapAction
{
	return objc_getAssociatedObject(self, @selector(tc_tapAction));
}

- (void) setTc_tapAction:(TCTapActionBlock)action
{
	self.userInteractionEnabled = YES;
	objc_setAssociatedObject(self, @selector(tc_tapAction), action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

	if (!self.tc_tapGestureRecognizer)
	{
		self.tc_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tc_reactOnTap:)];
		[self addGestureRecognizer:self.tc_tapGestureRecognizer];
	}
}

- (void) _tc_reactOnTap:(UIGestureRecognizer *)tapGestureRecognizer
{
	TCTapActionBlock action = self.tc_tapAction;
	if (action != nil)
	{
		action;
	}
}

- (UITapGestureRecognizer *) tc_tapGestureRecognizer
{
	return objc_getAssociatedObject(self, @selector(tc_tapGestureRecognizer));
}

- (void) setTc_tapGestureRecognizer:(UIGestureRecognizer *)recognizer
{
	objc_setAssociatedObject(self, @selector(tc_tapGestureRecognizer), recognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) setTarget:(id)object withAction:(SEL)action
{
	self.tc_tapAction = ^{
		[object performSelector:action];
	};
}
@end