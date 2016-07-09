//
// Created by Anastasia on 7/6/16.
//

#import <objc/runtime.h>
#import "TCImageView.h"
#import "KeepLayout/KeepLayout.h"

@implementation TCImageView
{
}

- (void) updateAspectConstraints
{
	self.keepAspectRatio.equal = self.image.size.width / self.image.size.height;
}

- (void) setImage:(UIImage *)image
{
	[super setImage:image];
	if (image != nil && [self superview] != nil)
	{
		[self updateAspectConstraints];
	}
}


- (void) didMoveToSuperview
{

	if (self.image != nil)
	{
		[self updateAspectConstraints];
	}
}
@end