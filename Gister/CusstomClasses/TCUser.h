//
// Created by Anastasia on 6/26/16.
//

#import <UIKit/UIKit.h>

@interface TCUser : NSObject
@property (strong, nonatomic) UIImage  *avatar;
@property (strong, nonatomic) NSString *avatar_url;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSURL    *gitURL;
@property (strong, nonatomic) NSURL    *followersURL;
@property (strong, nonatomic) NSURL    *followingsURL;
@property (strong, nonatomic) NSURL    *gistsURL;
@property (strong, nonatomic) NSDate   *registrationDate;
@property (strong, nonatomic) NSArray  *gists;
+(instancetype) unmap:(NSDictionary *)dictionary;
@end