//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>
#import "TCUser.h"

@interface TCServerManager : NSObject
+(instancetype)shared;
-(void)getInformationForUser:(TCUser *)user callback:(void(^)(TCUser *, NSError *))callback;
@end