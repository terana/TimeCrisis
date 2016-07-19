//
// Created by Anastasia on 6/27/16.
//

#import <UIKit/UIKit.h>
#import "TCGistsListViewDelegate.h"

@interface TCPublicGistsListViewController : UIViewController <TCGistsListViewDelegate>
@property (strong, nonatomic) NSString *gistsURL;
@end