//
// Created by Anastasia on 7/18/16.
//

#import <UIKit/UIKit.h>

@protocol TCProfileScreenViewDelegate <NSObject>
- (void) openGists;
- (void) openFollowers;
- (void) openFollowing;
- (void) openStarred;
- (void) signOut;
@end