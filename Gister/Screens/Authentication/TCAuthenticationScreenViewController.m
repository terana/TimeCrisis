//
// Created by Anastasia on 7/5/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCAuthenticationScreenViewController.h"
#import "TCGithubAuthenticationViewController.h"

@implementation TCAuthenticationScreenViewController
{
}

- (void) signIn
{
	[[self navigationController] pushViewController:[TCGithubAuthenticationViewController new] animated:YES];
}
@end