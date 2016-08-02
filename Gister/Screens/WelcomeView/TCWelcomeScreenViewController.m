//
// Created by Anastasia on 7/5/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCWelcomeScreenViewController.h"
#import "TCWelcomeScreenView.h"
#import "TCPresentationManager.h"
#import "TCServerManager.h"
#import "NSObject+TCDoWith.h"

@interface TCWelcomeScreenViewController () <TCAuthenticationScreenViewDelegate>
@end

@implementation TCWelcomeScreenViewController
{
}

- (void) signIn
{
	__unused UIActivityIndicatorView *activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] tc_with:^(UIActivityIndicatorView *o) {
		o.hidden           = YES;
		o.color            = [UIColor grayColor];
		o.hidesWhenStopped = YES;
		[self.view addSubview:o];
		o.keepCenter.equal = 0.5;
	}];
	[activityIndicator startAnimating];
	[[TCServerManager shared] signInFromViewController:self callback:^(NSError *error) {
		if (error == nil)
		{
			[activityIndicator stopAnimating];
			[[TCPresentationManager shared] openInitialView];
		}
		else
		{
			[[TCPresentationManager shared] showMessageWithError:error sender:self callback:nil];
		}
	}];
}
@end