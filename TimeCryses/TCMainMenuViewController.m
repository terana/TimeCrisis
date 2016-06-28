//
// Created by Anastasia on 6/20/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMainMenuViewController.h"
#import "NSObject+TCDoWith.h"
#import "UIView+TCTapAction.h"
#import "TCButton.h"
#import "TCDraggableView.h"
#import "TCTableViewController.h"
#import "TCTableWithGistsViewController.h"

@implementation TCMainMenuViewController
- (void) loadView
{
	self.view = [UIView tc_with:^(UIView *o) {
		o.backgroundColor = [UIColor whiteColor];

		__unused TCDraggableView *viewWithLabels = [TCDraggableView tc_with:^(TCDraggableView *oo) {
			oo.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
			[o addSubview:oo];
			oo.keepCenter.equal = 0.5;

			__unused UILabel *label1 = [UILabel tc_with:^(UILabel *ooo) {
				ooo.text = @"L1";
				[oo addSubview:ooo];
				ooo.keepTopInset.equal         = 0;
				ooo.keepHorizontalInsets.min   = 0;
				ooo.keepHorizontalCenter.equal = 0.5;
			}];

			__unused UILabel *label2 = [UILabel tc_with:^(UILabel *ooo) {
				ooo.text         = @"Ткнуть";
				ooo.tc_tapAction = ^(UILabel *sender) {
					NSLog(@"Меня ткнули! %@", sender.text);
				};
				[oo addSubview:ooo];
				ooo.keepTopOffsetTo(label1).equal = 20;
				ooo.keepHorizontalInsets.min      = 0;
				ooo.keepBottomInset.equal         = 0;
				ooo.keepHorizontalCenter.equal    = 0.5;
			}];
		}];
		__unused TCButton        *button         = [TCButton tc_with:^(TCButton *oo) {
			oo.label.textColor = [UIColor greenColor];
			oo.label.text      = @"Синяя Кнопка";
			oo.backgroundColor = [UIColor redColor];
			[oo setTarget:self withAction:@selector(methodForButton:)];
			[o addSubview:oo];
			oo.keepTopOffsetTo(viewWithLabels).equal = 50;
			oo.keepHorizontalCenter.equal            = 0.5;
		}];

		__unused TCButton *nextViewButton = [TCButton tc_with:^(TCButton *oo) {
			oo.label.text      = @"Next";
			oo.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
			[oo setTarget:self withAction:@selector(nextView:)];
			[o addSubview:oo];
			oo.keepBottomInset.equal      = 10;
			oo.keepHorizontalCenter.equal = 0.5;
		}];
	}];
}

- (void) nextView:(UIView *)sender
{
	TCTableWithGistsViewController *tableWithGistsViewController = [TCTableWithGistsViewController new];
	tableWithGistsViewController.modalPresentationStyle = UIModalPresentationFullScreen;
	tableWithGistsViewController.modalTransitionStyle   = UIModalTransitionStyleCoverVertical;
	[self presentViewController:tableWithGistsViewController animated:YES completion:nil];
}

- (void) methodForButton:(UIView *)sender
{
//	[self changeBackgroundColorOf:self.view toColor:[[UIColor blackColor] colorWithAlphaComponent:0.1]];
	[self moveSenderUp:sender];
}

- (void) changeBackgroundColorOf:(UIView *)view toColor:(UIColor *)color
{
	view.backgroundColor = color;
}

- (void) moveSenderUp:(UIView *)sender
{
	CGSize size = self.view.bounds.size;
	[UIView animateWithDuration:0.33 animations:^{
		CGRect rect = sender.frame;
		rect.origin.x = arc4random() % (int) size.width;
		rect.origin.y = arc4random() % (int) size.height;

		sender.frame = rect;
	}];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end