//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCImageView.h"
#import "TCGist.h"
#import "TCFile.h"

@class TCServerManager;
@class TCViewController;

@protocol TCServerManagerDelegate
- (void) serverManager:(TCServerManager *)serverManager foundExpiredToken:(NSString *)expiredToken;
@end;

@interface TCServerManager : NSObject
@property (weak, nonatomic) id <TCServerManagerDelegate> delegate;
+ (instancetype) shared;
- (BOOL) foundAccessToken;
- (NSURLRequest *) requestForWebView;
- (void) signInFromViewController:(TCViewController *)viewController callback:(void (^)(NSError *))callback;
- (void) getAccessParametersFromURL:(NSString *)url withCallback:(void (^)(NSError *error))callback;
- (void) dropCookies;
- (void) getInformationForMainUserWithCallback:(void (^)(TCUser *, NSError *))callback;
- (void) getGistsForMainUserWithCallback:(void (^)(NSArray *, NSError *))callback;
- (void) getImageWithURL:(NSString *)imageURL callback:(void (^)(UIImage *, NSError *))callback;
- (void) getGistsForUser:(TCUser *)user callback:(void (^)(NSArray *, NSError *))callback;
- (void) getPublicGistsWithCallback:(void (^)(NSArray *, NSError *))callback;
- (void) createGist:(TCGist *)gist callback:(void (^)(TCGist *, NSError *))callback;
- (void) editGist:(TCGist *)gist withCallback:(void (^)(TCGist *, NSError *))callback;
- (void) getFileContentForFile:(TCFile *)file withCallback:(void (^)(NSString *, NSError *))callback;
- (void) getFollowersForUser:(TCUser *)user withCallback:(void (^)(NSArray *, NSError *))callback;
- (void) getFollowingForUser:(TCUser *)user withCallback:(void (^)(NSArray *, NSError *))callback;
- (void) getStarredGistsWithCallback:(void (^)(NSArray *, NSError *))callback;
- (void) getInformationForUser:(TCUser *)user withCallback:(void (^)(TCUser *, NSError *))callback;
- (void) deleteGist:(TCGist *)gist withCallback:(void (^)(NSError *))callback;
@end