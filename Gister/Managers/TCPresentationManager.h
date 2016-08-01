//
// Created by Anastasia on 7/29/16.
//

#import <UIKit/UIKit.h>

@class TCServerManager;
@class TCViewController;

@interface TCPresentationManager : NSObject
+ (instancetype) shared;
- (void) openInitialView;
- (void) showMessageWithError:(NSError *)error sender: (TCViewController *)sender callback:(void (^)())callback;
- (void) openAuthenticationWebViewWithSender:(TCViewController *)sender callback:(BOOL(^)(NSURLRequest *))callback;
- (void) openMainUserProfileWithSender:(TCViewController *)sender;
@end