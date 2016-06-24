//
// Created by Anastasia on 6/22/16.
//

#import "TCDraggableView.h"

@implementation TCDraggableView
{
	CGRect _savedFrame;
}
- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.userInteractionEnabled        = YES;
		UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drag:)];
		[self addGestureRecognizer:recognizer];
	}

	return self;
}

- (void) drag:(UIPanGestureRecognizer *)recognizer
{
	switch (recognizer.state)
	{
		case UIGestureRecognizerStatePossible:
			break;
		case UIGestureRecognizerStateBegan:
			_savedFrame = self.frame;
			break;
		case UIGestureRecognizerStateChanged:
		{
			CGPoint point = [recognizer locationInView:self.superview];
			CGRect  rect  = self.frame;
			rect.origin.x = point.x - rect.size.width / 2.f;
			rect.origin.y = point.y - rect.size.height / 2.f;
			self.frame    = rect;
			break;
		}
		case UIGestureRecognizerStateEnded:
		{
			[UIView animateWithDuration:0.33 animations:^{
				self.frame = _savedFrame;
			}];
			break;
		}
		case UIGestureRecognizerStateCancelled:
			break;
		case UIGestureRecognizerStateFailed:
			break;
	}
}
@end