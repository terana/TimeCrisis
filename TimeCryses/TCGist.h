//
// Created by Anastasia on 6/29/16.
//

#import <Foundation/Foundation.h>

@interface TCGist : NSObject
@property (strong, nonatomic) NSURL    *url;
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSDate   *creationDate;
@property (strong, nonatomic) NSDate   *updatingDate;
@property (strong, nonatomic) NSString *gistDescription;
@property (strong, nonatomic) NSArray*files;
@end