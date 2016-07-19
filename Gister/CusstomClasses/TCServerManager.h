//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"
#import "TCImageView.h"

@interface TCServerManager : NSObject
+ (instancetype) shared;
- (void) getInformationForUserWithCallback:(void (^)(TCUser *, NSError *))callback;
- (void) getImageWithURL:(NSString *)imageURL callback:(void (^)(UIImage *, NSError *))callback;
- (void) getGistsForUser:(TCUser *)user callback:(void (^)(NSArray *, NSError *))callback;
- (void) getPublicGistsWithCallback:(void (^)(NSArray *, NSError *))callback;
@end