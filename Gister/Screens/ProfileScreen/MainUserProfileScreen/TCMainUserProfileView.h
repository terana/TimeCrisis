//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCTableViewContainer.h"

@class TCUser;

@protocol TCMainUserProfileViewDelegate <NSObject>
- (void) openGists;
- (void) openFollowers;
- (void) openFollowing;
- (void) openStarred;
- (void) signOut;
@end

@interface TCMainUserProfileView : TCTableViewContainer
@property (strong, nonatomic) TCUser                   *user;
@property (weak, nonatomic) id <TCMainUserProfileViewDelegate> delegate;
@end