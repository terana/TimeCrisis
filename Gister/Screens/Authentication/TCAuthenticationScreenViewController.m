//
// Created by Anastasia on 7/5/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCAuthenticationScreenViewController.h"
#import "TCGithubAuthenticationViewController.h"

@implementation TCAuthenticationScreenViewController
{
}

/*- (void) loadView
{

	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor               = [UIColor whiteColor];

		__unused UIView *viewWithLogo = [UIView tc_with:^(UIView *oo) {
			oo.backgroundColor = [UIColor whiteColor];
			[o addSubview:oo];
			oo.keepTopMarginInset.equal = [[NSUserDefaults standardUserDefaults] floatForKey:@"inset"] + 30;
			oo.keepHeight.equal = 100;
			oo.keepLeftMarginInset.equal = 0;

			__unused TCImageView *logo = [TCImageView tc_with:^(TCImageView *ooo) {
				ooo.image = [UIImage imageNamed:@"ninja_octocat"];
				[oo addSubview:ooo];
				ooo.keepVerticalInsets.equal = 0;
				ooo.keepLeftInset.equal = 0;
			}];

			__unused UILabel *name = [UILabel tc_with:^(UILabel *ooo) {
				ooo.text = @" Gister ";
				ooo.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
				ooo.layer.cornerRadius = 105;
				[oo addSubview:ooo];
				ooo.keepTopMarginInset.equal = 0;
				ooo.keepLeftOffsetTo(logo).equal = 5;
				ooo.keepRightMarginInset.equal = 0;
			}];

			__unused TCButton *signIn = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
				ooo.label.text      = @" Sign in ";
				[ooo setTarget:self withAction:@selector(authentication:)];
				[oo addSubview:ooo];
				ooo.keepTopOffsetTo(name).equal = 5;
				ooo.keepLeftOffsetTo(logo).equal = 5;
				ooo.keepRightMarginInset.min = 0;
			}];
		}];
	}];
}*/

- (void) signIn
{
	[[self navigationController] pushViewController:[TCGithubAuthenticationViewController new] animated:YES];
}

	@end