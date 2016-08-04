//
// Created by Anastasia on 7/29/16.
//

#import <UIKit/UIKit.h>

@class TCServerManager;
@class TCViewController;
@class TCUser;
@class TCGist;
@class TCFile;

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
- (void) openNewGistScreenWithSender:(TCViewController *)sender;
- (void) openMainUserFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender;
- (void) openOtheUserFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender;
- (void) returnToFilesOfGist:(TCGist *)gist withSender:(TCViewController *)sender;
- (void) openNewFile:(TCFile *)file withSender:(TCViewController *)sender;
- (void) openOtherUserContentOfFile:(TCFile *)file withSender:(TCViewController *)sender;
- (void) openMainUserContentOfFile:(TCFile *)file withSender:(TCViewController *)sender;
- (void) openRenamingOfFile:(TCFile *)file withSender:(TCViewController *)sender;
- (void) showGistRemovingAlertWithSender:(TCViewController *)sender action:(void (^)())action;
@end