//
// Created by Anastasia on 7/25/16.
//

#import "UIViewController+ShowError.h"

@implementation UIViewController (ShowError)
- (void) showMessageWithError:(NSError *)error callback:(void(^)())callback;
{
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertActionStyleDefault];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		callback();
	}]];
}
@end