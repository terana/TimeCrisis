//
// Created by Anastasia on 7/10/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCMyPageHeaderView.h"
#import "NSObject+TCDoWith.h"
#import "UIView+TCTapAction.h"
#import "TCHeaderViewSelected.h"

@implementation TCMyPageHeaderView
{
}
-(instancetype) init
{
	self = [super init];
	if (self)
	{
		self.backgroundColor = [UIColor whiteColor];
		__unused UILabel *myPageLabel = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
			o.text = @" My Page ";
			o.layer.cornerRadius = 10;
			[o setTarget:_delegate withAction:@selector(loadMainUserScreen)];
			[self addSubview:o];
			o.keepVerticalInsets.equal = 0;
			o.keepLeftInset.equal = 0;
		}];

		__unused UILabel *createGistlabel = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
			o.text = @" Create gist ";
			o.layer.cornerRadius = 10;
			//[o setTarget:se withAction:<#(SEL)action#>];
			[self addSubview:o];
			o.keepVerticalInsets.equal = 0;
			o.keepLeftOffsetTo(myPageLabel).equal = 1;
			o.keepWidthTo(myPageLabel).equal = 1;
		}];

		__unused UILabel *signOutLabel = [UILabel tc_with:^(UILabel *o) {
			o.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
			o.text = @" Sign out ";
			o.layer.cornerRadius = 10;
			//[o setTarget:se withAction:<#(SEL)action#>];
			[self addSubview:o];
			o.keepVerticalInsets.equal = 0;
			o.keepLeftOffsetTo(createGistlabel).equal = 1;
			o.keepRightInset.equal = 0;
			o.keepWidthTo(myPageLabel).equal = 1;
		}];
	}
	return  self;
}
@end