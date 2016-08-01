//
// Created by Anastasia on 7/29/16.
//

#import <UIKit/UIKit.h>

@class TCServerManager;
@class TCViewController;
@class TCUser;

@interface TCPresentationManager : NSObject
+ (instancetype) shared;
- (void) openInitialView;
- (void) showMessageWithError:(NSError *)error sender:(TCViewController *)sender callback:(void (^)())callback;
- (void) openAuthenticationWebViewWithSender:(TCViewController *)sender callback:(BOOL(^)(NSURLRequest *))callback;
- (void) openMainUserGistsWithSender:(TCViewController *)sender;
- (void) openFollowers:(NSArray *)followers withSender:(TCViewController *)sender;
- (void) openFollowing:(NSArray *)following withSender:(TCViewController *)sender;
- (void) openStarredGists:(NSArray *)gists withSender:(TCViewController *)sender;
- (void) openOtherUserGists:(NSArray *)gists withSender:(TCViewController *)sender;
@end