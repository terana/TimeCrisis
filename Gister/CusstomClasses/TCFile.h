//
// Created by Anastasia on 7/2/16.
//

#import <Foundation/Foundation.h>
#import "TCGist.h"

@interface TCFile : NSObject
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *fileType;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *rawURL;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *changedName;
@property (weak, nonatomic) TCGist     *gist;
@property (nonatomic) NSInteger        fileSize;
@property (nonatomic) BOOL changed;
@end