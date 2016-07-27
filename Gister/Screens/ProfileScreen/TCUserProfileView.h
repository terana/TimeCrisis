//
// Created by Anastasia on 7/26/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@protocol TCProfileViewDelegate;
@class TCUser;

@interface TCUserProfileView : TCTableViewContainer
{
@protected
	TCUser *_user;
	__weak id     _delegate;
}
@property (strong, nonatomic) TCUser                   *user;
@property (weak, nonatomic) id <TCProfileViewDelegate> delegate;
@end