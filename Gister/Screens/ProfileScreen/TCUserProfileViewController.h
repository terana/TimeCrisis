//
// Created by Anastasia on 7/26/16.
//


#import <UIKit/UIKit.h>
#import "TCViewController.h"
#import "TCUser.h"
#import "TCProfileViewDelegate.h"

@interface TCUserProfileViewController : TCViewController <TCProfileViewDelegate>
{
	@protected
	TCUser *_user;
}
@property (strong, nonatomic) TCUser *user;
@end