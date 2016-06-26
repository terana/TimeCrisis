//
// Created by Anastasia on 6/24/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCTableViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithTable.h"
#import "TCUser.h"

@implementation TCTableViewController
{
}
- (void) loadView
{
	self.view = [TCViewWithTable tc_with:^(TCViewWithTable *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	TCUser *userRuslan = [TCUser new];
	userRuslan.name = @"Ruslan";
	userRuslan.rang = @"loh";
	userRuslan.registrationDate.year = 2016;
	userRuslan.registrationDate.month = 1;
	userRuslan.photo = [UIImage imageNamed:@"Ruslan"];

	TCUser *userAnastasia = [TCUser new];
	userAnastasia.name = @"Anastasia";
	userAnastasia.rang = @"molodec";
	userAnastasia.registrationDate.year = 2016;
	userAnastasia.registrationDate.month = 2;
	userAnastasia.photo = [UIImage imageNamed:@"Anastasia"];

	TCUser *userAnton = [TCUser new];
	userAnton.name = @"Anton";
	userAnton.rang = @"nyashka";
	userAnton.registrationDate.year = 2016;
	userAnton.registrationDate.month = 3;
	userAnton.photo = [UIImage imageNamed:@"Anton"];

	TCUser *userYoulya= [TCUser new];
	userYoulya.name = @"Youlya";
	userYoulya.rang = @"youlya";
	userYoulya.registrationDate.year = 2016;
	userYoulya.registrationDate.month = 4;
	userYoulya.photo = [UIImage imageNamed:@"Youlya"];

	TCViewWithTable *view = self.view;
	view.data = @[userAnastasia, userAnton, userRuslan, userYoulya];
}

- (void) updateOnClassInjection
{
	[self loadView];
}

@end