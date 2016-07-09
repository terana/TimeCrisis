//
// Created by Anastasia on 6/24/16.
//

#import <KeepLayout/KeepLayout.h>
#import "TCTableViewController.h"
#import "NSObject+TCDoWith.h"
#import "TCViewWithUserTable.h"
#import "TCUser.h"
#import "NSDate+TCDateString.h"

@implementation TCTableViewController
{
}
- (void) loadView
{
	self.view = [TCViewWithUserTable tc_with:^(TCViewWithUserTable *o) {
		o.backgroundColor = [UIColor whiteColor];
	}];
}

- (void) viewDidLoad
{
	TCUser *userRuslan = [TCUser new];
	userRuslan.login             = @"Ruslan";
	userRuslan.registrationDate = [NSDate dateFromString:@"01.01.2016"];
	userRuslan.avatar            = [UIImage imageNamed:@"Ruslan"];

	TCUser *userAnastasia = [TCUser new];
	userAnastasia.login             = @"Anastasia";
	userAnastasia.registrationDate = [NSDate dateFromString:@"01.03.2016"];
	userAnastasia.avatar            = [UIImage imageNamed:@"Anastasia"];

	TCUser *userAnton = [TCUser new];
	userAnton.login             = @"Anton";
	userAnton.registrationDate = [NSDate dateFromString:@"01.03.2016"];
	userAnton.avatar            = [UIImage imageNamed:@"Anton"];

	TCUser *userYoulya = [TCUser new];
	userYoulya.login             = @"Youlya";
	userYoulya.registrationDate = [NSDate dateFromString:@"01.04.2016"];
	userYoulya.avatar            = [UIImage imageNamed:@"Youlya"];

	TCUser *userVladimir = [TCUser new];
	userVladimir.login             = @"Владимир Олегович";
	userVladimir.registrationDate = [NSDate dateFromString:@"11.04.2016"];
	userVladimir.avatar            = [UIImage imageNamed:@"Vladimir"];

	TCViewWithUserTable *view = self.view;
	view.data = @[ userAnastasia, userAnton, userRuslan, userYoulya, userVladimir ];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end