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

@implementation TCMainMenuViewController
- (void) loadView
{
	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor = [UIColor whiteColor];

		__unused UIView *viewWithButtons = [UIView tc_with:^(UIView *oo) {
			oo.backgroundColor = [UIColor whiteColor];

			__unused TCButton *showRecentGistsButton = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
				ooo.label.text      = @"Show Recent Gists";
				[ooo setTarget:self withAction:@selector(showRecentGists:)];
				[oo addSubview:ooo];
				oo.keepHorizontalCenter.equal = 0.5;
				oo.keepHorizontalInsets.equal = 0.5;
				oo.keepTopInset.equal         = 0;
			}];

			__unused TCButton *showMyGistsButton = [TCButton tc_with:^(TCButton *ooo) {
				ooo.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
				ooo.label.text      = @"Show My Gists";
				[ooo setTarget:self withAction:@selector(showMyGists:)];
				[oo addSubview:ooo];
				oo.keepHorizontalCenter.equal                   = 0.5;
				oo.keepHorizontalInsets.equal                   = 0.5;
				oo.keepTopOffsetTo(showRecentGistsButton).equal = 5;
			}];

			[o addSubview:oo];
			o.keepCenter.equal = 0.5;
		}];
	}];
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