//
// Created by Anastasia on 7/5/16.
//

#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import "TCAuthenticationViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCButton.h"

@implementation TCAuthenticationViewController
{
}

- (void) loadView
{
	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor               = [UIColor whiteColor];
		__unused TCButton *signInButton = [TCButton tc_with:^(TCButton *oo) {
			oo.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
			oo.label.text      = @"Sign in";
			[oo setTarget:self withAction:@selector(authentication:)];
			[o addSubview:oo];
			oo.keepCenter.equal = 0.5;
		}];
	}];
}

- (void) authentication:(UIView *)sender
{
	NSURL *url = [NSURL URLWithString:@"https://github.com/login/oauth/authorize/?"
			@"client_id=dc665db234579172b3b8"
			@"&redirect_uri=gister://"
			@"&scope=user%2Cgist"
			@"&state=1234"
			@"&allow_signup=true"];
	[[UIApplication sharedApplication] openURL:url];
}
@end