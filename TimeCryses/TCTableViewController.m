//
// Created by Anastasia on 6/24/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCTableViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithTable.h"
#import "TCUser.h"
#import "NSDate+TCDateString.h"

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
	userRuslan.name             = @"Ruslan";
	userRuslan.rang             = @"loh";
	userRuslan.registrationDate = [NSDate dateFromString:@"01.01.2016"];
	userRuslan.photo            = [UIImage imageNamed:@"Ruslan"];

	TCUser *userAnastasia = [TCUser new];
	userAnastasia.name             = @"Anastasia";
	userAnastasia.rang             = @"molodec";
	userAnastasia.registrationDate = [NSDate dateFromString:@"01.03.2016"];
	userAnastasia.photo            = [UIImage imageNamed:@"Anastasia"];

	TCUser *userAnton = [TCUser new];
	userAnton.name             = @"Anton";
	userAnton.rang             = @"nyashka";
	userAnton.registrationDate = [NSDate dateFromString:@"01.03.2016"];
	userAnton.photo            = [UIImage imageNamed:@"Anton"];

	TCUser *userYoulya = [TCUser new];
	userYoulya.name             = @"Youlya";
	userYoulya.rang             = @"youlya";
	userYoulya.registrationDate = [NSDate dateFromString:@"01.04.2016"];
	userYoulya.photo            = [UIImage imageNamed:@"Youlya"];

	TCUser *userVladimir = [TCUser new];
	userVladimir.name             = @"Владимир Олегович";
	userVladimir.rang             = @"препод";
	userVladimir.registrationDate = [NSDate dateFromString:@"11.04.2016"];
	userVladimir.photo            = [UIImage imageNamed:@"Vladimir"];

	TCViewWithTable *view = self.view;
	view.data = @[ userAnastasia, userAnton, userRuslan, userYoulya, userVladimir ];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end