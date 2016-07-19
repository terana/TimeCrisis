//
// Created by Anastasia on 6/26/16.
//

#import <UIKit/UIKit.h>
#import "TCImageView.h"

@interface TCUser : NSObject
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *gitURL;
@property (strong, nonatomic) NSString *followersURL;
@property (strong, nonatomic) NSString *followingsURL;
@property (strong, nonatomic) NSString *gistsURL;
@property (strong, nonatomic) NSDate   *registrationDate;
@property (strong, nonatomic) NSArray  *gists;
+ (instancetype) unmap:(NSDictionary *)dictionary;
@end