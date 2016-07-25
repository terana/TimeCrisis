//
// Created by Anastasia on 7/6/16.
//

#import <objc/runtime.h>
#import "TCImageView.h"
#import "KeepLayout/KeepLayout.h"
#import "TCServerManager.h"

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

- (void) setImageURL:(NSString *)imageURL
{
	_imageURL = imageURL;
	[[TCServerManager shared] getImageWithURL:imageURL callback:^(UIImage *image, NSError *error) {
		if (error == nil)
		{
			self.image = image;
		}
	}];
}
@end