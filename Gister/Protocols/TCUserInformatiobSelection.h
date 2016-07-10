//
// Created by Anastasia on 7/8/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"

@protocol TCUserInformatiobSelection <NSObject>
- (void) openGitHubPage:(NSURL *)url;
- (void) openFollowers:(NSURL *)followers_url;
- (void) openFollowings:(NSURL *)following_url;
- (void) openGistsList:(UIView *)sender;
-(void) openGist:(TCGist *)gist;
@end