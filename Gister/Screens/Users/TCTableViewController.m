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


	TCUser *userAnastasia = [TCUser new];
	userAnastasia.login             = @"Anastasia";
	userAnastasia.registrationDate = [NSDate dateFromString:@"01.03.2016"];


	TCUser *userAnton = [TCUser new];
	userAnton.login             = @"Anton";
	userAnton.registrationDate = [NSDate dateFromString:@"01.03.2016"];


	TCUser *userYoulya = [TCUser new];
	userYoulya.login             = @"Youlya";
	userYoulya.registrationDate = [NSDate dateFromString:@"01.04.2016"];


	TCUser *userVladimir = [TCUser new];
	userVladimir.login             = @"Владимир Олегович";
	userVladimir.registrationDate = [NSDate dateFromString:@"11.04.2016"];


	TCViewWithUserTable *view = self.view;
	view.data = @[ userAnastasia, userAnton, userRuslan, userYoulya, userVladimir ];
}

- (void) updateOnClassInjection
{
	[self loadView];
}
@end