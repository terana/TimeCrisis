//
// Created by Anastasia on 7/26/16.
//

#import <Foundation/Foundation.h>

@class TCUser;

@protocol TCUsersListViewDelegate <NSObject>
-(void) openProfileOfUser:(TCUser *)user;
@end