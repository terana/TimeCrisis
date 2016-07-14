//
// Created by Anastasia on 7/14/16.
//

#import "TCGithubAuthenticationViewController.h"

@implementation TCGithubAuthenticationViewController
{
}
+ (Class) viewClass
{
	return [UIWebView class];
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	NSURL        *url     = [NSURL URLWithString:@"https://github.com/login/oauth/authorize/?"
			@"client_id=dc665db234579172b3b8"
			@"&redirect_uri=gister://"
			@"&scope=user%2Cgist"
			@"&state=1234"
			@"&allow_signup=true"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	UIWebView *webView = self.view;
	[webView loadRequest:request];
}
@end