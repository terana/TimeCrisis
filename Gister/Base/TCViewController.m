//
// Created by Anastasia on 7/11/16.
//

#import <objc/runtime.h>
#import "TCViewController.h"

@implementation TCViewController
{
}

+ (Class) viewClass
{
	return nil;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.automaticallyAdjustsScrollViewInsets = NO;
	}
	return self;
}

- (void) loadView
{
	Class  explicitViewClass = [[self class] viewClass];
	Class  implicitViewClass = NSClassFromString([NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"Controller" withString:@""]);
	UIView *view             = [explicitViewClass ? : implicitViewClass ? : [UIView class] new];

	if (![view isKindOfClass:[UIScrollView class]] && [view performSelector:@selector(setDelegate:)])
	{
		[view performSelector:@selector(setDelegate:) withObject:self];
	}

	self.view = view;
}

//To switch on the custom implementation of _setContentOverlayInsets:
- (BOOL) layoutMarginsAutomaticAdjustmentEnabled
{
	return YES;
}

- (void) _setContentOverlayInsets:(UIEdgeInsets)insets //Hidden system private method
{
	if (![self layoutMarginsAutomaticAdjustmentEnabled])
	{
		//Default implementation
		((void (*)(id, SEL, UIEdgeInsets)) class_getMethodImplementation([UIViewController class], _cmd))(self, _cmd, insets);
		return;
	}

	/*
	 * insets are:
	 * top = navigationBar.heigh if any or 0
	 * left = right = 16
	 * bottom = tapBar.height if any or 0
	 */

	UIEdgeInsets superMargins = self.view.superview.layoutMargins;
	insets.top += superMargins.top;
	insets.bottom += superMargins.bottom;
	UIView *view = self.view;
	view.preservesSuperviewLayoutMargins = YES;
	if ([view isKindOfClass:[UIScrollView class]])
	{
		[self applyInsets:insets toScrollView:(UIScrollView *) view];
	}
	else
	{
		[self applyInsets:insets toView:view];
	}
}

- (void) applyInsets:(UIEdgeInsets)insets toScrollView:(UIScrollView *)scrollView
{
	UIEdgeInsets topAndBottom = UIEdgeInsetsMake(insets.top, 0, insets.bottom, 0);
	scrollView.contentInset          = topAndBottom;
	scrollView.scrollIndicatorInsets = topAndBottom;
}

- (void) applyInsets:(UIEdgeInsets)insets toView:(UIView *)view
{
	view.layoutMargins = insets;
}
@end