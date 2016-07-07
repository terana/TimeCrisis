//
// Created by Anastasia on 6/20/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMainMenuViewController.h"
#import "NSObject+TCDoWith.h"
#import "UIView+TCTapAction.h"
#import "TCButton.h"
#import "TCDraggableView.h"
#import "TCTableWithGistsViewController.h"
#import "TCUserViewController.h"

@implementation TCMainMenuViewController
{
}

- (void) loadView
{
	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor = [UIColor whiteColor];

		__unused UIView *viewWithButtons = [UIView tc_with:^(UIView *oo) {
			oo.backgroundColor = [UIColor whiteColor];
			[o addSubview:oo];
			oo.keepCenter.equal = 0.5;

			__unused TCButton *showRecentGistsButton = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
				ooo.label.text      = @"Show Recent Gists";
				[ooo setTarget:self withAction:@selector(showRecentGists:)];
				[oo addSubview:ooo];
				ooo.keepHorizontalCenter.equal = 0.5;
				ooo.keepHorizontalInsets.equal = 0.5;
				ooo.keepTopInset.equal         = 0;
			}];

			__unused TCButton *showMyGistsButton = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
				ooo.label.text      = @"Show My Gists";
				[ooo setTarget:self withAction:@selector(showMyGists:)];
				[oo addSubview:ooo];
				ooo.keepHorizontalCenter.equal                   = 0.5;
				ooo.keepHorizontalInsets.equal                   = 0.5;
				ooo.keepTopOffsetTo(showRecentGistsButton).equal = 5;
			}];

			__unused TCButton *showUserButton = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
				ooo.label.text      = @"MyPage";
				[ooo setTarget:self withAction:@selector(showUser:)];
				[oo addSubview:ooo];
				ooo.keepHorizontalCenter.equal                   = 0.5;
				ooo.keepHorizontalInsets.equal                   = 0.5;
				ooo.keepTopOffsetTo(showMyGistsButton).equal = 5;
				ooo.keepBottomInset.equal = 0;
			}];

		}];
	}];
}

-(void)showUser:sender
{
	TCUserViewController *vc = [TCUserViewController new];
	vc.authenticationParametrs = _authenticationParametrs;
	[self.navigationController pushViewController:vc animated:YES];
}

- (void) showMyGists:(UIView *)sender
{
}

- (void) showRecentGists:(UIView *)sender
{
	[self.navigationController pushViewController:[TCTableWithGistsViewController new] animated:YES];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end