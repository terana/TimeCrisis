//
// Created by Anastasia on 6/26/16.
//

#import <UIKit/UIKit.h>

@interface TCUser : NSObject
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *rang;
@property (strong, nonatomic) NSDateComponents * registrationDate;
@end