//
// Created by Anastasia on 6/29/16.
//

#import <Foundation/Foundation.h>

@class TCUser;

@interface TCGist : NSObject
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSDate   *creationDate;
@property (strong, nonatomic) NSDate   *updatingDate;
@property (strong, nonatomic) NSString *gistDescription;
@property (strong, nonatomic) NSArray  *files;
@property (strong, nonatomic) TCUser *owner;
@property (nonatomic) BOOL public;
+ (instancetype) unmap:(NSDictionary *)dictionary;
@end