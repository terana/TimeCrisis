//
// Created by Anastasia on 7/12/16.
//

#import <UIKit/UIKit.h>

@interface TCServer : NSObject
-(instancetype)initWithServerURL:(NSString *)URL;
-(void)doGet:(NSString *)path withParameters:(NSDictionary *)parameters callback:(void(^)(id, NSError *))callback;
-(void)doGetWithURL:(NSString *)url callback:(void(^)(id, NSError *))callback;
@end