//
// Created by Anastasia on 7/2/16.
//

#import <Foundation/Foundation.h>

@interface TCFile : NSObject
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *fileType;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSURL    *rawURL;
@property (nonatomic) NSInteger        fileSize;
@end