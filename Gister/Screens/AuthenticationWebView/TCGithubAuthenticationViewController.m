//
// Created by Anastasia on 7/14/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCGithubAuthenticationViewController.h"
#import "TCServerManager.h"
#import "NSObject+TCDoWith.h"

@interface TCGithubAuthenticationViewController () <UIWebViewDelegate>
@end

@implementation TCGithubAuthenticationViewController
{
	__weak UIActivityIndicatorView *_activityIndicator;
}

+ (Class) viewClass
{
	return [UIWebView class];
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	UIWebView *webView = (UIWebView *) self.view;
	[webView loadRequest:[[TCServerManager shared] requestForWebView]];
}

- (void) loadView
{
	[super loadView];

	__unused UIActivityIndicatorView *activityIndicator = _activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] tc_with:^(UIActivityIndicatorView *o) {
		o.hidden           = YES;
		o.color            = [UIColor grayColor];
		o.hidesWhenStopped = YES;
		[self.view addSubview:o];
		o.keepCenter.equal = 0.5;
	}];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
	[_activityIndicator startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
	[_activityIndicator stopAnimating];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	return _callback(request);
}
@end