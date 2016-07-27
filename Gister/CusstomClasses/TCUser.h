//
// Created by Anastasia on 6/26/16.
//

#import <UIKit/UIKit.h>
#import "TCImageView.h"

@interface TCUser : NSObject
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSDate   *registrationDate;
@property (strong, nonatomic) NSArray  *gists;
@property (strong, nonatomic) NSString *organizationsURL;
+ (instancetype) unmap:(NSDictionary *)dictionary;
@end