//
// Created by Anastasia on 7/8/16.
//

#import <UIKit/UIKit.h>
#import "TCGist.h"

@protocol TCUserInformatiobSelection <NSObject>
- (void) openGitHubPage;
- (void) openFollowers;
- (void) openFollowings;
- (void) openGistsList:(UIView *)sender;
-(void) openGist:(TCGist *)gist;
@end