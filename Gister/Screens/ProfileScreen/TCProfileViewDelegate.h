//
// Created by Anastasia on 7/18/16.
//

#import <UIKit/UIKit.h>

@protocol TCProfileViewDelegate <NSObject>
@required
- (void) openGists;
- (void) openFollowers;
- (void) openFollowing;
@optional
- (void) openStarred;
- (void) signOut;
@end