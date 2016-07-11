//
// Created by Anastasia on 7/8/16.
//

#import "UIScrollView+scrollingEnabled.h"

@implementation UIScrollView (scrollingEnabled)

- (BOOL) tc_scrollingEnabled
{
	for (id object in self.gestureRecognizers)
	{
		if ([object  isKindOfClass:[UIPanGestureRecognizer class]])
		{
			return YES;
		}
	}
	return NO;

}

- (void) setTc_scrollingEnabled:(BOOL)tc_scrollingEnabled
{
	BOOL enabled = self.tc_scrollingEnabled;
	if (tc_scrollingEnabled == YES && enabled == NO)
	{
		NSArray *array = [self.gestureRecognizers arrayByAddingObject:[UIPanGestureRecognizer new]];
		self.gestureRecognizers = array;
		return;
	}
	if(tc_scrollingEnabled == NO && enabled == YES)
	{
		NSMutableArray *array = [NSMutableArray new];
		for (id object in self.gestureRecognizers)
		{
			if ([object  isKindOfClass:[UIPanGestureRecognizer class]] == NO)
			{
				[array addObject:object];
			}
		}
		self.gestureRecognizers = array;
	}
}
@end