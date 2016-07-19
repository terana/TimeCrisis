//
// Created by Anastasia on 7/14/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCGithubAuthenticationViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCGithubAuthenticationView.h"

@interface TCGithubAuthenticationViewController () <UIWebViewDelegate>
@end

@implementation TCGithubAuthenticationViewController
{
	UIActivityIndicatorView *_activityIndicator;
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
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPShouldHandleCookies:YES];

	TCGithubAuthenticationView   *webView = self.view;
	[webView loadRequest:request];


}

-(void) viewDidLoad
{
	__unused UIActivityIndicatorView *activityIndicator = _activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] tc_with:^(UIActivityIndicatorView *o) {
		o.hidden = YES;
		o.color = [UIColor grayColor];
		o.hidesWhenStopped = YES;
		[self.view addSubview:o];
		o.keepCenter.equal = 0.5;
	}];
}

- (void) displayActivityIndicator
{
	[_activityIndicator startAnimating];
}

- (void) hideActivityIndicator
{
	[_activityIndicator stopAnimating];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
	[self displayActivityIndicator];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
	[self hideActivityIndicator];
}

@end